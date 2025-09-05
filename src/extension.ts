import * as fs from "fs";
import * as path from "path";
import * as vscode from "vscode";

// 简化的文件扩展名映射
const companionExtensions = new Map<string, string[]>([
  [".tsx", [".module.scss", ".scss", ".css", ".ts"]],
  [".jsx", [".module.scss", ".scss", ".css", ".js"]],
  [".ts", [".tsx", ".scss", ".css"]],
  [".js", [".jsx", ".scss", ".css"]],
  [".scss", [".tsx", ".jsx", ".ts", ".js"]],
  [".css", [".tsx", ".jsx", ".ts", ".js"]],
  [".module.scss", [".tsx", ".jsx"]],
  [".module.css", [".tsx", ".jsx"]],
]);

export function activate(context: vscode.ExtensionContext) {
  console.log("Companion File Switcher is now active!");

  const openCompanion = vscode.commands.registerCommand(
    "companionFileSwitcher.openCompanion",
    () => {
      openCompanionFile(false);
    }
  );

  const openCompanionToSide = vscode.commands.registerCommand(
    "companionFileSwitcher.openCompanionToSide",
    () => {
      openCompanionFile(true);
    }
  );

  context.subscriptions.push(openCompanion, openCompanionToSide);
}

async function openCompanionFile(openToSide: boolean) {
  const activeEditor = vscode.window.activeTextEditor;

  if (!activeEditor) {
    vscode.window.showInformationMessage("No active editor found");
    return;
  }

  const currentFile = activeEditor.document.uri.fsPath;
  const companionFiles = findCompanionFiles(currentFile);

  if (companionFiles.length === 0) {
    vscode.window.showInformationMessage("No companion files found");
    return;
  }

  let fileToOpen: string;
  if (companionFiles.length === 1) {
    fileToOpen = companionFiles[0];
  } else {
    const items = companionFiles.map((file) => ({
      label: path.basename(file),
      description: path.dirname(file),
      file: file,
    }));

    const selected = await vscode.window.showQuickPick(items, {
      placeHolder: "Select a companion file to open",
    });

    if (!selected) {
      return;
    }
    fileToOpen = selected.file;
  }

  const document = await vscode.workspace.openTextDocument(fileToOpen);

  if (openToSide) {
    await vscode.window.showTextDocument(document, vscode.ViewColumn.Beside);
  } else {
    await vscode.window.showTextDocument(document);
  }
}

function findCompanionFiles(currentFilePath: string): string[] {
  const parsedPath = path.parse(currentFilePath);
  const currentExtension = parsedPath.ext;
  const baseName = parsedPath.name;
  const directory = parsedPath.dir;

  // 处理 .module.scss 这样的复合扩展名
  let actualBaseName = baseName;
  let actualExtension = currentExtension;

  if (baseName.endsWith(".module")) {
    actualBaseName = baseName.replace(".module", "");
    actualExtension = ".module" + currentExtension;
  }

  const possibleExtensions = companionExtensions.get(actualExtension) || [];
  const companionFiles: string[] = [];

  for (const ext of possibleExtensions) {
    let targetFileName: string;

    if (ext.startsWith(".module")) {
      targetFileName = actualBaseName + ".module" + ext.replace(".module", "");
    } else {
      targetFileName = actualBaseName + ext;
    }

    const targetFilePath = path.join(directory, targetFileName);

    if (fs.existsSync(targetFilePath) && targetFilePath !== currentFilePath) {
      companionFiles.push(targetFilePath);
    }
  }

  return companionFiles;
}

export function deactivate() {}
