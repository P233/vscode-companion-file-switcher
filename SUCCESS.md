# 🎉 Companion File Switcher 已安装成功！

恭喜！您的 Companion File Switcher 扩展已经成功安装到 VS Code 中，现在可以在所有项目中使用这个强大的功能了。

## ✅ 安装状态

- ✅ 扩展已编译
- ✅ 扩展已打包 (`companion-file-switcher-1.0.0.vsix`)
- ✅ 扩展已安装到 VS Code
- ✅ 支持自动创建缺失的伴侣文件
- ✅ 全局可用，适用于所有项目

## 🚀 立即体验

### 1. 在您的项目中测试
1. 重启 VS Code（如果还没重启的话）
2. 打开您的 `LandingPage.tsx` 文件
3. 按 `Cmd+Alt+O` (Mac) 或 `Ctrl+Alt+O` (Windows/Linux)
4. 扩展会自动切换到 `LandingPage.module.scss`

### 2. 创建新的伴侣文件
1. 打开任何支持的文件（如 `.tsx`, `.jsx`, `.vue` 等）
2. 按 `Cmd+Alt+O` 如果没有对应的样式文件
3. 选择 "$(plus) Create xxx.module.scss" 选项
4. 扩展会自动创建文件并包含智能模板

### 3. 并排编辑
1. 打开组件文件
2. 按 `Cmd+Alt+Shift+O` (Mac) 或 `Ctrl+Alt+Shift+O` (Windows/Linux)
3. 样式文件将在右侧编辑器中打开，实现左右分栏编辑

## 📋 功能总览

### 快捷键
| 功能 | Mac | Windows/Linux |
|------|-----|---------------|
| 切换到伴侣文件 | `Cmd+Alt+O` | `Ctrl+Alt+O` |
| 在侧边打开伴侣文件 | `Cmd+Alt+Shift+O` | `Ctrl+Alt+Shift+O` |

### 支持的文件类型
- **React/TypeScript**: `.tsx` ↔ `.module.scss`, `.scss`, `.css`, `.ts`
- **JavaScript**: `.jsx` ↔ `.module.scss`, `.scss`, `.css`, `.js`
- **Vue**: `.vue` ↔ `.scss`, `.css`, `.ts`, `.js`
- **样式文件**: `.module.scss` ↔ `.tsx`, `.jsx`, `.ts`, `.js`

### 自动生成的模板
- **React组件**: 包含导入样式和基础JSX结构
- **SCSS模块**: 包含以组件名命名的CSS类
- **Vue组件**: 完整的单文件组件模板
- **TypeScript/JavaScript**: 基础代码模板

### 右键菜单
- 编辑器右键菜单中的快速访问
- 文件浏览器右键菜单选项
- 编辑器标题栏按钮

## 🎯 使用场景

### 场景 1: React 开发
```
MyComponent.tsx ← → MyComponent.module.scss
```
在组件和样式之间快速切换，提高开发效率。

### 场景 2: 创建新组件
1. 创建 `NewComponent.tsx`
2. 按 `Cmd+Alt+O` 
3. 选择创建 `NewComponent.module.scss`
4. 扩展自动生成对应的样式文件和模板

### 场景 3: 并排开发
同时查看和编辑组件代码与样式，无需在标签页间切换。

## 🛠️ 高级功能

- **智能文件检测**: 自动识别项目中的文件模式
- **多文件支持**: 当存在多个伴侣文件时提供选择菜单
- **模板系统**: 根据文件类型自动生成合适的起始代码
- **路径智能**: 正确处理相对路径和导入语句

## 🔧 扩展管理

### 卸载扩展
如需卸载：
```bash
code --uninstall-extension companion-file-switcher
```

### 更新扩展
当有新版本时，VS Code 会自动提示更新，或者您可以重新运行安装脚本。

## 🎉 开始享受高效开发！

现在您可以在任何 VS Code 项目中使用这个强大的文件切换功能了。无论是 React、Vue、TypeScript 还是其他现代前端项目，都能大幅提升您的开发效率！

---

**祝您编码愉快！** 🚀

如有任何问题或建议，欢迎反馈。
