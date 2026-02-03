---
sticker: lucide//atom
---
# 06: Architecture - The Penguin Pipeline
**Vision:** Full Host-Guest State Orchestration

---

## 1. The Technology Stack (The "Pipe")
The workstation operates as a distributed system, leveraging three specific tiers:

| Layer           | Language/Tool | Responsibility                                   |
| :---            | :---          | :---                                             |
| **Orchestration**| **Node.js** | Watching host-side tokens and translating UI state. |
| **Environment** | **Bash / Lua**| Initializing the Wayland/X11 bridge and NvChad UI. |
| **Persistence** | **Git / GH** | Delta-tracking design docs and config backups.   |

## 2. Wayland Passthrough (The "Line")
By utilizing **Sommelier** and **Virtio-Wayland**, we achieve a high-performance passthrough that allows the "Penguin" container to feel native to ChromeOS.
* **Direct Composition:** GPU-accelerated terminal rendering (Kitty).
* **Input Fidelity:** Low-latency window management (i3-wm).
* **Network Bridge:** Localhost visibility in the host-side Chrome browser.



## 3. The Node.js "Pre-Script" Logic
The final component is the **State Translator**. This script executes before the UI launches to ensure the design language is injected into all configuration files via:
1. **Extraction:** Reading JSON/CSS from the ChromeOS shared mount.
2. **Translation:** Mapping values to Lua/Conf syntax.
3. **Injection:** Overwriting `.config` targets for a unified UX.

---


