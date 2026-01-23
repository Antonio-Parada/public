# 04: Clipboard IPC Bridge
**Protocol:** Cross-Server Bidirectional Buffer Synchronization
**Tools:** `xclip`, `wl-clipboard`, `autocutsel`, BASH

---

## 1. The "Air-Gap" Problem
By design, the ChromeOS Wayland compositor (Display `:0`) and the nested Xephyr server (Display `:2`) do not share memory. This results in a "Clipboard Silo":
* **The Security Boundary:** Wayland prevents background processes from "snooping" on the clipboard of other windows.
* **The Consequence:** Copying a URL in Chrome (Host) and attempting to paste it into a terminal in i3 (Guest) would fail, as the Guest's clipboard remains empty.

## 2. Engineering the Bidirectional Sync
We implemented a multi-layered synchronization strategy to bridge the air-gap while respecting the security constraints of the host.

### A. The Polling Daemon (The "Nuclear" Sync)
A background BASH loop was developed to poll the state of both clipboards every 500ms and "inject" the contents into the opposing server.
* **Host -> Guest:** Uses `xclip` to pull from the Host's `:0` clipboard and pipe it into the Guest's `:2` buffer.
* **Guest -> Host:** Uses `wl-copy` (the native Wayland tool) to broadcast the Guest's `:2` clipboard back to the ChromeOS host.

### B. Selection Management (`autocutsel`)
X11 utilizes two primary buffers: `CLIPBOARD` (Ctrl+C) and `PRIMARY` (Highlighting text). 
* **The Bridge:** `autocutsel` was deployed to keep these two buffers in sync *within* the Xephyr environment, ensuring that a simple text highlight in a terminal is immediately available for a "Paste" command in the browser.

## 3. The "Manual Push" Fallback
In scenarios where the polling daemon is delayed by system load, custom i3 keybindings were implemented to force an immediate IPC transfer:
* **Mod+Shift+C:** Forces the current Guest selection into the Host Wayland buffer via `wl-copy`.
* **Mod+Shift+V:** Explicitly pulls the Host buffer into the Guest's X11 clipboard.



## 4. Performance Considerations
The polling interval was tuned to **0.5s**. 
* **Rationale:** Shorter intervals (e.g., 0.1s) caused unnecessary CPU spikes in the Crostini container. 
* **Outcome:** The 0.5s delay is imperceptible during standard "Copy/Switch/Paste" workflows but maintains a near-zero idle resource footprint.

---
**Architectural Summary:** This bridge represents a custom IPC implementation that bypasses display server isolation through a secure, user-space pipe.
