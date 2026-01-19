# BrowserTools MCP for Zed

A Model Context Protocol (MCP) server that integrates browser monitoring and interaction capabilities with [[Zed]] editor's assistant system.

## Overview

The BrowserTools MCP allows you to capture screenshots, console logs, DOM elements, and run various audits (accessibility, performance, SEO, best practices) directly from within Zed's AI assistant interface.

## Components

### 1. Zed Extension
- **Location**: `/home/super/Documents/browser-tools-context-server/`
- **Language**: [[Rust]]
- **Purpose**: Provides the MCP server integration for Zed
- **Built**: Successfully compiled with `cargo build --release`

### 2. Chrome Extension  
- **Location**: `/home/super/Documents/browser-tools-extension/chrome-extension/`
- **Purpose**: Browser-side component for capturing data
- **Installation**: Load unpacked extension in Chrome Developer mode

### 3. Node.js Server
- **Package**: `@agentdeskai/browser-tools-server@1.2.0`
- **Location**: `/home/super/Documents/node_modules/.bin/browser-tools-server`
- **Purpose**: Backend server handling MCP communications
- **Port**: 3025 (default)

## Installation Status

### Prerequisites ✅
- [x] **[[Zed]]** Editor: `/home/super/.local/bin/zed`
- [x] **[[Rust]]**: v1.86.0 (installed via apt)
- [x] **[[Node.js]]**: v20.19.2
- [x] **[[npm]]**: v9.2.0

### Setup Completed ✅
- [x] **Rust/Cargo Installation**: Successfully installed
- [x] **Zed Settings Fixed**: JSON syntax error corrected
- [x] **Extension Build**: Rust extension compiled successfully
- [x] **Server Installation**: Node.js package installed locally
- [x] **Chrome Extension**: Downloaded and extracted
- [x] **Server Testing**: Confirmed working on port 3025

## Configuration

### Zed Settings
File: `/home/super/.config/zed/settings.json`

```json
{
  "context_servers": {
    "browser-tools-context-server": {
      "source": "extension",
      "settings": {
        "port": 3025,
        "host": "127.0.0.1",
        "server_command": "npx",
        "server_args": ["@agentdeskai/browser-tools-server@1.2.0"]
      }
    }
  }
}
```

### Chrome Extension Setup
1. Open Chrome and navigate to `chrome://extensions`
2. Enable "Developer mode"
3. Click "Load unpacked"
4. Select: `/home/super/Documents/browser-tools-extension/chrome-extension/`

## Usage

### Starting the Server
```bash
cd /home/super/Documents
./node_modules/.bin/browser-tools-server
```

### Available Slash Commands in Zed

#### Browser Capture
- `/browser-capture screenshot` - Take a screenshot of the current page
- `/browser-capture logs` - View browser console logs
- `/browser-capture errors` - View browser console errors
- `/browser-capture network` - View browser network logs
- `/browser-capture network-errors` - View browser network errors
- `/browser-capture clear` - Clear logged data
- `/browser-capture element` - Get information about a selected DOM element

#### Browser Audit
- `/browser-audit accessibility` - Run an accessibility audit
- `/browser-audit performance` - Run a performance audit
- `/browser-audit seo` - Run an SEO audit
- `/browser-audit best-practices` - Check best practices
- `/browser-audit nextjs` - Run NextJS-specific audit (if applicable)
- `/browser-audit all` - Run all available audits

#### Browser Debug
- `/browser-debug start` - Start comprehensive debugger mode

## Workflow

1. **Chrome Setup**: Ensure Chrome is running with BrowserTools extension enabled
2. **Server Start**: Launch the BrowserTools server (`./node_modules/.bin/browser-tools-server`)
3. **Zed Integration**: Open Zed and access the AI assistant
4. **Command Usage**: Use slash commands to interact with browser

## Troubleshooting

### Common Issues
- **Server Won't Start**: Check if port 3025 is available
- **Extension Not Loading**: Verify Chrome Developer Mode is enabled
- **Commands Not Working**: Ensure both Chrome extension and server are running

### Network Configuration
- **Default Host**: `127.0.0.1` (localhost only)
- **Default Port**: `3025`
- **Network Access**: Available on `http://192.168.7.182:3025` for network access

## Integration with [[Zed]]

This tool extends Zed's AI capabilities by providing direct access to browser data and analysis tools. It follows the [[Model Context Protocol]] standard for seamless integration with Zed's assistant system.

## Related Tools
- [[Zed]]
- [[Chrome Extensions]]
- [[Model Context Protocol]]
- [[Web Development]]
- [[Browser Debugging]]

## Status
**Setup Complete**: Ready for use with manual server startup.

## Next Steps
1. Install Chrome extension in browser
2. Test full workflow with a web page
3. Explore advanced audit capabilities
4. Consider automation scripts for server startup
