#!/bin/bash

# 设置独立的VS Code扩展项目

echo "🚀 Setting up independent VS Code extension project..."

# 设置变量
EXTENSION_NAME="vscode-companion-file-switcher"
TARGET_DIR="$HOME/Projects/SF/$EXTENSION_NAME"
CURRENT_DIR="$(pwd)"

echo "📁 Target directory: $TARGET_DIR"

# 创建目标目录
if [ -d "$TARGET_DIR" ]; then
    echo "⚠️  Directory already exists. Do you want to remove it and recreate? [y/N]"
    read -r response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        rm -rf "$TARGET_DIR"
        echo "🗑️  Removed existing directory"
    else
        echo "❌ Cancelled"
        exit 1
    fi
fi

mkdir -p "$TARGET_DIR"

# 复制扩展文件到新目录
echo "📋 Copying extension files..."
cp -r ./* "$TARGET_DIR/"

# 进入新目录
cd "$TARGET_DIR"

# 更新package.json中的仓库信息
echo "📝 Updating package.json..."
cat > package.json << 'EOF'
{
  "name": "vscode-companion-file-switcher",
  "displayName": "Companion File Switcher",
  "description": "Quickly switch between companion files (same name, different extensions) and create them if they don't exist. Perfect for React components and their style files.",
  "version": "1.0.0",
  "publisher": "local-dev",
  "repository": {
    "type": "git",
    "url": "https://github.com/your-username/vscode-companion-file-switcher"
  },
  "keywords": [
    "file-switcher",
    "companion-files",
    "react",
    "typescript",
    "scss",
    "css-modules",
    "productivity"
  ],
  "engines": {
    "vscode": "^1.74.0"
  },
  "categories": [
    "Other"
  ],
  "activationEvents": [],
  "main": "./out/extension.js",
  "contributes": {
    "commands": [
      {
        "command": "companionFileSwitcher.openCompanion",
        "title": "Open Companion File",
        "category": "Companion Switcher",
        "icon": "$(arrow-swap)"
      },
      {
        "command": "companionFileSwitcher.openCompanionToSide",
        "title": "Open Companion File to Side",
        "category": "Companion Switcher",
        "icon": "$(split-horizontal)"
      }
    ],
    "keybindings": [
      {
        "command": "companionFileSwitcher.openCompanion",
        "key": "ctrl+alt+o",
        "mac": "cmd+alt+o",
        "when": "editorTextFocus"
      },
      {
        "command": "companionFileSwitcher.openCompanionToSide",
        "key": "ctrl+alt+shift+o",
        "mac": "cmd+alt+shift+o",
        "when": "editorTextFocus"
      }
    ],
    "menus": {
      "editor/context": [
        {
          "command": "companionFileSwitcher.openCompanion",
          "group": "navigation@1",
          "when": "editorTextFocus"
        },
        {
          "command": "companionFileSwitcher.openCompanionToSide",
          "group": "navigation@2",
          "when": "editorTextFocus"
        }
      ],
      "explorer/context": [
        {
          "command": "companionFileSwitcher.openCompanion",
          "group": "navigation@1"
        },
        {
          "command": "companionFileSwitcher.openCompanionToSide",
          "group": "navigation@2"
        }
      ],
      "editor/title": [
        {
          "command": "companionFileSwitcher.openCompanion",
          "group": "navigation@1",
          "when": "editorIsOpen"
        },
        {
          "command": "companionFileSwitcher.openCompanionToSide",
          "group": "navigation@2",
          "when": "editorIsOpen"
        }
      ]
    }
  },
  "scripts": {
    "vscode:prepublish": "npm run compile",
    "compile": "tsc -p ./",
    "watch": "tsc -watch -p ./",
    "package": "vsce package",
    "publish": "vsce publish",
    "install-local": "code --install-extension *.vsix"
  },
  "devDependencies": {
    "@types/vscode": "^1.74.0",
    "@types/node": "16.x",
    "typescript": "^4.9.4",
    "@vscode/vsce": "^2.19.0"
  }
}
EOF

# 创建.gitignore
echo "📝 Creating .gitignore..."
cat > .gitignore << 'EOF'
node_modules/
out/
*.vsix
.vscode-test/
.nyc_output
coverage/
**/*.map.js

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE
.vscode/settings.json
.idea/

# Logs
logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*
pnpm-debug.log*
lerna-debug.log*
EOF

# 初始化Git仓库
echo "🔧 Initializing Git repository..."
git init
git add .
git commit -m "Initial commit: VS Code Companion File Switcher extension

Features:
- Switch between companion files (same name, different extensions)
- Auto-create missing companion files with smart templates
- Side-by-side editing support
- Keyboard shortcuts and context menu integration
- Support for React, Vue, TypeScript, SCSS, CSS modules, etc."

# 创建安装脚本
echo "📝 Creating install script..."
cat > install.sh << 'EOF'
#!/bin/bash

echo "🚀 Installing VS Code Companion File Switcher..."

# 安装依赖
npm install

# 编译
npm run compile

# 打包
npm run package

# 安装到VS Code
VSIX_FILE=$(ls *.vsix 2>/dev/null | head -n1)
if [ -n "$VSIX_FILE" ]; then
    code --install-extension "$VSIX_FILE"
    echo "✅ Extension installed successfully!"
    echo ""
    echo "🎉 Restart VS Code to use the extension."
    echo ""
    echo "📋 Usage:"
    echo "  • Cmd+Alt+O (Mac) / Ctrl+Alt+O (Win/Linux): Switch to companion file"
    echo "  • Cmd+Alt+Shift+O / Ctrl+Alt+Shift+O: Open companion file to side"
else
    echo "❌ Failed to create package"
    exit 1
fi
EOF

chmod +x install.sh

# 创建开发说明
echo "📝 Creating development guide..."
cat > DEVELOPMENT.md << 'EOF'
# Development Guide

## 项目结构
```
vscode-companion-file-switcher/
├── src/
│   └── extension.ts          # 扩展主代码
├── out/                      # 编译输出目录
├── package.json              # 扩展配置
├── tsconfig.json            # TypeScript配置
├── install.sh               # 本地安装脚本
├── README.md                # 项目说明
└── LICENSE                  # 许可证
```

## 本地开发

### 安装依赖
```bash
npm install
```

### 编译
```bash
npm run compile
```

### 监控模式编译
```bash
npm run watch
```

### 调试扩展
1. 用VS Code打开扩展目录
2. 按F5启动扩展开发窗口
3. 在新窗口中测试扩展功能

### 打包扩展
```bash
npm run package
```

### 安装到本地VS Code
```bash
./install.sh
```

## 修改扩展

### 添加新的文件类型支持
编辑 `src/extension.ts` 中的 `companionExtensions` Map：

```typescript
const companionExtensions = new Map<string, string[]>([
  ['.tsx', ['.module.scss', '.scss', '.css', '.ts']],
  // 添加新的文件类型...
]);
```

### 修改快捷键
编辑 `package.json` 中的 `keybindings` 部分。

### 添加新的模板
修改 `createCompanionFile` 函数中的模板生成逻辑。

## 安装和卸载

### 安装
```bash
./install.sh
```

### 卸载
```bash
code --uninstall-extension vscode-companion-file-switcher
```

### 查看已安装的扩展
```bash
code --list-extensions
```
EOF

echo ""
echo "✅ Independent project setup complete!"
echo ""
echo "📍 New project location: $TARGET_DIR"
echo ""
echo "🎯 Next steps:"
echo "1. cd $TARGET_DIR"
echo "2. ./install.sh  # Install the extension"
echo "3. Push to GitHub if desired:"
echo "   git remote add origin https://github.com/your-username/vscode-companion-file-switcher.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "🔄 To reinstall after changes:"
echo "   cd $TARGET_DIR && ./install.sh"
