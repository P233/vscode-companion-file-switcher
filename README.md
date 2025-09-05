# Companion File Switcher

A powerful VS Code extension that helps you quickly switch between related files and create them if they don't exist. Perfect for modern web development workflows!

## ✨ Features

- 🚀 **Quick File Switching**: Instantly switch between companion files (same name, different extensions)
- 📁 **Auto-Create Missing Files**: Create companion files with intelligent templates if they don't exist
- 🔄 **Side-by-Side View**: Open companion files in split view for simultaneous editing
- 🎯 **Smart File Detection**: Supports React, Vue, TypeScript, SCSS, CSS modules, and more
- ⚡ **Keyboard Shortcuts**: Fast navigation with customizable hotkeys
- 📋 **Context Menus**: Right-click options in editor and file explorer

## 🚀 Quick Start

1. Open any supported file (e.g., `Component.tsx`)
2. Press `Cmd+Alt+O` (Mac) / `Ctrl+Alt+O` (Windows/Linux) to switch to companion file
3. If companion doesn't exist, choose to create it from the dropdown
4. Use `Cmd+Alt+Shift+O` / `Ctrl+Alt+Shift+O` to open companion file side-by-side

## 📁 Supported File Types

| Primary File     | Companion Files                        |
| ---------------- | -------------------------------------- |
| `.tsx`           | `.module.scss`, `.scss`, `.css`, `.ts` |
| `.jsx`           | `.module.scss`, `.scss`, `.css`, `.js` |
| `.vue`           | `.scss`, `.css`, `.ts`, `.js`          |
| `.module.scss`   | `.tsx`, `.jsx`, `.ts`, `.js`           |
| `.scss` / `.css` | `.tsx`, `.jsx`, `.ts`, `.js`           |
| `.ts` / `.js`    | Component files and styles             |

## ⌨️ Keyboard Shortcuts

| Action                      | Mac               | Windows/Linux      |
| --------------------------- | ----------------- | ------------------ |
| Switch to companion file    | `Cmd+Alt+O`       | `Ctrl+Alt+O`       |
| Open companion file to side | `Cmd+Alt+Shift+O` | `Ctrl+Alt+Shift+O` |

## 🎯 Usage Examples

### React Component Development

```
MyComponent.tsx ↔ MyComponent.module.scss
```

### Vue Development

```
MyComponent.vue ↔ MyComponent.scss
```

### TypeScript Projects

```
utils.ts ↔ utils.test.ts
```

## 🛠️ Auto-Generated Templates

When creating new files, the extension generates intelligent starter templates:

### React Component (`.tsx`)

```tsx
import css from "./Component.module.scss";

export default function Component() {
  return <div className={css.component}>{/* Add your component content here */}</div>;
}
```

### SCSS Module (`.module.scss`)

```scss
.component {
  // Add your styles here
}
```

### Vue Component (`.vue`)

```vue
<template>
  <div class="component">
    <!-- Add your template here -->
  </div>
</template>

<script>
export default {
  name: "Component",
};
</script>

<style scoped>
.component {
  /* Add your styles here */
}
</style>
```

## 📋 Context Menu Integration

Right-click on any file or in the editor to access:

- **Open Companion File**: Switch to existing companion
- **Open Companion File to Side**: Open companion in split view

## 🔧 Installation

### For Local Development/Testing

This extension is designed for local use and development. To install and use:

1. **Clone or download this repository**
2. **Navigate to the project directory**:
   ```bash
   cd vscode-companion-file-switcher
   ```
3. **Run the installation script**:
   ```bash
   ./install.sh
   ```
4. **Restart VS Code** to activate the extension

**Alternative Manual Installation**:

```bash
# Install dependencies and compile
npm install
npm run compile
npm run package

# Install the generated .vsix file
code --install-extension companion-file-switcher-1.0.0.vsix
```

### From VS Code Marketplace

1. Open VS Code
2. Go to Extensions (`Ctrl+Shift+X`)
3. Search for "Companion File Switcher"
4. Click Install

### Manual Installation

1. Download the `.vsix` file
2. Run: `code --install-extension companion-file-switcher-1.0.0.vsix`

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

MIT License - see LICENSE file for details.

## 🐛 Issues

Found a bug or have a feature request? Please [open an issue](https://github.com/your-username/companion-file-switcher/issues).

---

**Enjoy coding with Companion File Switcher!** 🚀
