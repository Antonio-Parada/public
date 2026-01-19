# BrowserTools MCP - Quick Usage Guide

## 🚀 Step-by-Step Usage

### 1. Pre-Setup Checklist
- ✅ Chrome extension installed at `chrome://extensions`
- ✅ Zed extension installed via "Install Dev Extension"
- ✅ BrowserTools server running (`./browser-tools-server.sh`)
- ✅ Test page open: `file:///home/super/Documents/test-page.html`

### 2. Access Zed Assistant
**Three ways to open the AI Assistant in Zed:**

1. **Keyboard**: `Ctrl+Enter` (fastest)
2. **UI Button**: Click "Assistant" in the activity bar (right side)
3. **Command Palette**: `Ctrl+Shift+P` → type "assistant" → "Open Assistant Panel"

### 3. Using Slash Commands

In the assistant chat input, type any of these commands:

#### 📸 Capture Commands
```
/browser-capture screenshot
/browser-capture logs  
/browser-capture errors
/browser-capture network
/browser-capture network-errors
/browser-capture element
/browser-capture clear
```

#### 🔍 Audit Commands
```
/browser-audit accessibility
/browser-audit performance
/browser-audit seo
/browser-audit best-practices
/browser-audit all
```

#### 🐛 Debug Commands
```
/browser-debug start
```

## 🧪 Testing Workflow

1. **Open test page** in Chrome: `file:///home/super/Documents/test-page.html`
2. **Start with a screenshot**: `/browser-capture screenshot`
3. **Generate some logs**: Click buttons on test page, then `/browser-capture logs`
4. **Run an audit**: `/browser-audit accessibility`

## 🔧 Troubleshooting

### Command Not Working?
- ✅ Check server is running: `netstat -tlpn | grep :302[56]`
- ✅ Verify Chrome extension is active (icon should be visible)
- ✅ Make sure you're in the Assistant panel in Zed
- ✅ Type the slash command exactly (starts with `/`)

### Extension Not Found in Zed?
- Go to Zed Extensions → "Install Dev Extension"
- Select: `/home/super/Documents/browser-tools-context-server/`
- Look for "BrowserTools Context Server" in extension list

### Chrome Extension Issues?
- Navigate to `chrome://extensions`
- Ensure "Developer mode" is ON
- Look for "BrowserTools" extension
- If missing, click "Load unpacked" → select `/home/super/Documents/browser-tools-extension/chrome-extension/`

## 📋 Quick Commands Reference

| Command | Purpose |
|---------|---------|
| `/browser-capture screenshot` | Capture current page |
| `/browser-capture logs` | View console messages |
| `/browser-audit all` | Run complete audit |
| `/browser-debug start` | Full debug session |

## 💡 Pro Tips

- **Start simple**: Try `/browser-capture screenshot` first
- **Use the test page**: It's designed to generate logs, errors, and network activity
- **Check both Chrome and Zed**: Both need the respective extensions installed
- **Server auto-detects ports**: If 3025 is busy, it uses 3026, 3027, etc.

---
*For complete setup instructions, see [[BrowserTools-MCP]].*
