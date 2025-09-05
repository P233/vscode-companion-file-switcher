#!/bin/bash

echo "🚀 Installing VS Code Companion File Switcher..."

# 安装依赖
pnpm install

# 编译
pnpm run compile

# 打包
pnpm run package

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
