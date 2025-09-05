# 如何使用 Companion File Switcher 扩展

## 快速开始

1. **安装扩展**

   ```bash
   cd /path/to/your/project/.vscode-extension
   ./install.sh
   ```

2. **在 VS Code 中测试扩展**

   - 用 VS Code 打开扩展目录：`/path/to/your/project/.vscode-extension`
   - 按 `F5` 启动扩展开发窗口
   - 在新窗口中打开您的项目：`/path/to/your/project`

3. **使用扩展**
   - 打开 `src/pages/LandingPage/LandingPage.tsx` 文件
   - 按 `Cmd+Alt+O` 切换到 `LandingPage.module.scss`
   - 按 `Cmd+Alt+Shift+O` 在右侧打开样式文件

## 功能演示

### 场景 1：从 TypeScript 文件切换到样式文件

- 打开：`LandingPage.tsx`
- 按键：`Cmd+Alt+O`
- 结果：切换到 `LandingPage.module.scss`

### 场景 2：侧边打开相关文件

- 打开：`LandingPage.tsx`
- 按键：`Cmd+Alt+Shift+O`
- 结果：在右侧编辑器中打开 `LandingPage.module.scss`

### 场景 3：从样式文件回到组件文件

- 打开：`LandingPage.module.scss`
- 按键：`Cmd+Alt+O`
- 结果：切换到 `LandingPage.tsx`

### 场景 4：右键菜单使用

- 在文件浏览器中右键点击 `LandingPage.tsx`
- 选择 "Open Companion File" 或 "Open Companion File to Side"

## 快捷键

| 功能             | Mac 快捷键        | Windows/Linux 快捷键 |
| ---------------- | ----------------- | -------------------- |
| 切换相关文件     | `Cmd+Alt+O`       | `Ctrl+Alt+O`         |
| 侧边打开相关文件 | `Cmd+Alt+Shift+O` | `Ctrl+Alt+Shift+O`   |

## 支持的文件配对

- `.tsx` ↔ `.module.scss`, `.scss`, `.css`, `.ts`
- `.jsx` ↔ `.module.scss`, `.scss`, `.css`, `.js`
- `.module.scss` ↔ `.tsx`, `.jsx`, `.ts`, `.js`
- `.module.css` ↔ `.tsx`, `.jsx`, `.ts`, `.js`
- `.vue` ↔ `.scss`, `.css`, `.ts`, `.js`

## 故障排除

如果扩展不工作：

1. 确认扩展已正确编译（运行 `npm run compile`）
2. 检查 VS Code 开发者控制台是否有错误信息
3. 确认文件名匹配（相同基础名称，不同扩展名）

## 自定义配置

您可以修改 `src/extension.ts` 中的 `companionExtensions` Map 来添加更多文件类型支持。
