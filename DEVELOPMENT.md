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
