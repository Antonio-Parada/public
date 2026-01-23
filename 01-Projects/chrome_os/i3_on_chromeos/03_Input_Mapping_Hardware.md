# 03: Input Mapping & Hardware Constraints
**Focus:** Input Redirection and Terminal Optimization
**Hardware Target:** Chromebook Minimalist Keyboard (Globe/Search Layout)

---

## 1. The Modifier Key Conflict
In a Tiling Window Manager (TWM), the "Modifier" ($mod) key is the pivot for all operations. On standard hardware, this is typically `Super_L` (Windows Key). 

### The Chromebook Barrier:
* **The "Globe" Key:** On many Chromebooks, the Globe/Language key is hard-coded into the ChromeOS UI layer for input method switching. 
* **The "Search" Key:** While physically present, it is often intercepted by the host for the "Launcher" function.
* **Detection Failure:** `xev` (X Event Viewer) confirmed that these keys are often "consumed" by the host compositor before they can reach the nested Xephyr display.

## 2. Selection of Mod1 (Alt)
To ensure maximum stability and zero-conflict with host system shortcuts, **`Mod1` (Alt)** was selected as the primary modifier. 
* **Rationale:** Alt is consistently passed through to the Linux container without interception, providing the most reliable "UX Bridge" for navigation commands.

## 3. Terminal Selection: The Transition to Kitty
Initial testing used `xterm`, but it was discarded due to legacy rendering and lack of modern clipboard support. **Kitty** was selected as the primary terminal emulator for the environment.

### Technical Advantages of Kitty:
* **GPU Acceleration:** Kitty offloads rendering to the GPU, significantly reducing the "input lag" often felt when nesting an X11 server inside a Wayland compositor.
* **Flexoki Integration:** Unlike `xterm`, Kitty allows for easy, file-based color configuration, enabling the seamless implementation of the **Flexoki Light** theme.
* **Modern Clipboard Logic:** Kitty maps to `Ctrl+Shift+C/V` natively, solving the "No-Insert-Key" problem on Chromebooks.

## 4. Keybinding Strategy
To maintain developer velocity, the following custom mappings were implemented in the `i3` config:
* **Terminal Launch:** `$mod + Return` -> `kitty`
* **Process Termination:** `$mod + Shift + Q` -> `kill`
* **Layout Management:** `$mod + H/V` -> Directional splitting
* **Clipboard Forcing:** Dedicated shortcuts were created to manually trigger the IPC bridge when automatic polling fails.



---
**Implementation Note:** By mapping `Ctrl+Shift+V` in the Kitty configuration, we avoided the ergonomic strain of the Chromebook's "Search+Period" (Insert) simulated keypress.
