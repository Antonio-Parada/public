# 02: Architecture - The Xephyr Nest
**System Design:** Logical Partitioning and Display Virtualization
**Primary Tooling:** Xephyr (X11 Server), BASH, Systemd (Crostini)

---

## 1. The "Clean Room" Concept
To solve the instability identified in Phase 1 (Wayland Passthrough), we implemented a nested server model. This architecture treats the tiling window manager not as a system-wide compositor, but as a **sandboxed application** running within its own virtualized display buffer.

## 2. Technical Component Breakdown

### A. Xephyr: The Guest Server
Xephyr is an X server that targets a window on a host X server (or Wayland compositor) as its framebuffer.
* **Command:** `Xephyr -br -ac -noreset -screen 1024x768 :2`
* **`-br`:** Resets the background to black (clean slate).
* **`-ac`:** Disables Access Control. This is critical in a containerized environment to allow IPC tools (like `xclip`) to connect to the new display without complex X-cookie handshakes.
* **`:2`:** The designated display number, chosen to avoid conflict with the host’s `:0` and `:1` sockets.

### B. Environment Scoping (`env -u`)
Isolation is maintained by "scrubbing" the environment before launching i3. We explicitly unset variables that would lead i3's children back to the ChromeOS shelf.
* **Variable Stripping:** `SOMMELIER_VERSION`, `DISPLAY`, `WAYLAND_DISPLAY`.
* **Redirection:** We then re-inject `DISPLAY=:2` so that every terminal (Kitty) or utility spawned by i3 is "caged" within the Xephyr window.

## 3. Launch Workflow (`start_i3.sh`)
The initialization sequence is highly deterministic to prevent race conditions:
1. **Socket Cleanup:** `rm -f /tmp/.X11-unix/X2` ensures no stale lock-files prevent the server from starting.
2. **Asynchronous Init:** Xephyr is pushed to the background.
3. **Connectivity Wait-Loop:** A BASH loop polls for the existence of the X2 socket file. This ensures i3 does not attempt to launch before the display buffer is ready.
4. **Window Manager Execution:** `i3` is launched using a dedicated config path (`-c ~/.config/i3-nested/config`).

## 4. Architectural Diagram
```text
[ ChromeOS (Wayland/Aura) ]
          |
          v
[ Sommelier Translation Layer ]
          |
          v
[ Xephyr Server (Display :2) ]  <-- [ IPC Clipboard Bridge ]
          |
          v
[ i3-wm (Window Manager) ]
    /      |      \
 [Kitty] [Kitty] [Kitty]
