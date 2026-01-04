---
sticker: lucide//arrow-big-down
---
# Project: Hyprland Tablet Integration (Galaxy Tab S6 Lite)

**Date:** 2026-01-03
**System:** Omarchy (Arch Linux) / Hyprland
**Device:** Samsung Galaxy Tab S6 Lite (S-Pen)
**Status:** ✅ Working (Virtual Hardware Method)

---

## 1. The Core Problem
I needed to turn my Android tablet into a professional input device for my desktop (drawing, absolute positioning).

Two approaches were attempted. The "Macro" approach failed due to system bloat and poor tech stack. The "Virtual Hardware" approach succeeded.

---

## 2. Approach A: "The Macro Solution" (Failed)
*Technical Debt & Bloat*

**The Strategy:**
Use **KDE Connect** to receive input, but force it to communicate via **ydotool** (a background daemon that injects keypresses).

**Why it Failed:**
1.  **Root/Sudo Requirement:** `ydotool` requires root privileges to inject input. I had to edit `sudoers` or run a root daemon, creating a security hole and "dirty" config.
2.  **Portal Conflicts:** KDE Connect tried to use the `RemoteDesktop` portal (unsupported by Hyprland), causing `dbus` crashes and `[File exists]` errors in logs.
3.  **Input Quality:** It only emulated a generic mouse. No pressure sensitivity, no tilt, and "relative" movement (like a trackpad) instead of "absolute" (like a Wacom tablet).

**Action Taken:**
* Uninstall `ydotool`.
* Remove `exec-once = sudo ydotoold...` from Hyprland config.
* Revert `sudoers` changes.

---

## 3. Approach B: "The Real Solution" (Success)
*Virtual Hardware Emulation*

**The Strategy:**
Use **Weylus**. Instead of "faking" mouse clicks, Weylus creates a **Virtual Stylus Device** (`/dev/uinput`) at the kernel level. Hyprland sees this exactly like a physical Wacom tablet plugged into USB.

**Why it Works:**
1.  **Native Drivers:** Linux handles it as a real drawing tablet (Pressure & Tilt support).
2.  **No Root Daemon:** Using a standard `udev` rule allows the regular user to create the device securely.
3.  **Clean Config:** No startup scripts needed in Hyprland; just launch the app when needed.

---

## 4. Implementation Log

### A. Dependencies
Installed `weylus-bin` from AUR.

### B. Permissions (The "Clean" Way)
Instead of running as sudo, I added a udev rule to allow my user group to create virtual hardware.

**File:** `/etc/udev/rules.d/60-weylus.rules`
```bash
KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"


Commands used:

`sudo groupadd -f uinput
sudo usermod -aG uinput $USER
# Reboot required`


3. Usage & Workflow
The "Input Fight": When active, the Tablet (Absolute position) and Laptop Trackpad (Relative position) will fight for the cursor.

Drawing Mode: Start Weylus. Trackpad may become unresponsive or glitchy.

Desktop Mode: Stop Weylus server to return full control to the trackpad.

## 3. Usage & Workflow

**The "Input Fight":** When active, the Tablet (Absolute position) and Laptop Trackpad (Relative position) will fight for the cursor.

- **Drawing Mode:** Start Weylus. Trackpad may become unresponsive or glitchy.
    
- **Desktop Mode:** Stop Weylus server to return full control to the trackpad.
  
  
  ## ~/.config/hypr/hyprland.conf

_Ensures portals and environment variables are healthy._

Ini, TOML

```
# --- Core Environment ---
# Essential for Systemd/Portals (Screen Sharing) to see the session
exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

# --- Deprecated / Removed ---
# exec-once = /usr/lib/kdeconnectd  # (Wrong path, bloat)
# exec-once = sudo ydotoold ...     # (Security risk)
```