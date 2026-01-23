# 01: Wayland Passthrough Post-Mortem
**Research Path:** Native Sommelier/Wayland Integration
**Objective:** Evaluation of i3-wm as a primary compositor via the ChromeOS Sommelier layer.

---

## 1. Initial Hypothesis
The initial engineering goal was to run `i3` directly on the host display (`:0`). In theory, the **Sommelier** translation layer (which maps X11 calls to Wayland) should have allowed `i3` to manage windows natively alongside ChromeOS apps.

## 2. Technical Friction Points
During testing, three critical failure points were identified:

### A. The "Sommelier Leak" (Environment Scoping)
By default, the Linux container shares environment variables with the host. When `i3` was launched on `:0`, it lacked a "True Root" window. 
* **Result:** Child processes (terminals, browsers) would frequently bypass the `i3` tiling logic and "leak" onto the ChromeOS shelf, appearing as standalone windows managed by the host's window manager (Aura) rather than `i3`.

### B. Input Interception Conflict
The host Wayland compositor maintains exclusive control over high-level key combinations (e.g., Search+L, Alt+Tab). 
* **Result:** `i3` could not reliably intercept the `$mod` key (Alt or Search). This led to "Short-Circuiting," where a key combination intended for the dev environment would trigger a ChromeOS system action (like locking the screen or opening the Launcher).

### C. Client-Side Decoration (CSD) Mismatch
ChromeOS applications use modern Wayland decorations. Legacy X11 apps inside `i3` expect server-side decorations.
* **Result:** Visual artifacts, including double title bars, transparent window shadows that "clipped" into the tiling grid, and unpredictable resizing behavior.

## 3. Engineering Conclusion: Transition to Nesting
The attempt to force a Tiling Window Manager to share a compositor with a Desktop Window Manager (Aura) violated the principle of **Process Isolation**. 

**The Pivot:** To achieve a stable workflow, we moved to a **Nested Server Model (Xephyr)**. This effectively "air-gapped" the `i3` display logic from the host, creating a controlled sandbox where `i3` is the undisputed authority of its own display buffer (`:2`).

---
**Root Cause:** Architectural incompatibility between Sommelier’s application-level translation and i3’s system-level orchestration.
**Resolution:** Migration to Xephyr (X11-over-Wayland virtualization).
