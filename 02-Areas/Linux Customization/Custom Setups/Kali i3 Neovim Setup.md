# Kali i3 Neovim Setup

This note details an integrated Linux customization setup combining Kali Linux as the operating system, i3 as the tiling window manager, and Neovim with a custom Lua configuration as the primary text editor/IDE. This setup is geared towards efficiency, keyboard-driven workflow, and a powerful development environment, particularly for cybersecurity and software development tasks.

## Components

*   **Operating System:** [[Kali]] Linux
    *   Chosen for its comprehensive suite of penetration testing and security auditing tools.
*   **Window Manager:** [[Linux Customization/i3/i3]]
    *   Provides a lightweight, keyboard-centric tiling window management experience, maximizing screen real estate and minimizing mouse usage.
*   **Text Editor/IDE:** [[Linux Customization/Neovim/Neovim]]
    *   A highly extensible Vim-based editor, configured with a "chad configuration" (e.g., NvChad, AstroNvim) for an out-of-the-box IDE-like experience.
*   **Neovim Lua Configuration:** [[Linux Customization/Neovim/Lua Configuration]]
    *   Custom Lua functionality within Neovim for personalized keybindings, plugin management, and workflow automation.
*   **Dotfiles Management:** [[Dotfiles/Dotfiles]]
    *   Configuration files for i3, Neovim, and other tools are managed as dotfiles, ensuring consistency and easy synchronization across systems.

## Workflow Philosophy

This setup emphasizes a keyboard-driven workflow, rapid task switching, and efficient resource utilization. It's designed for users who spend significant time in the terminal and require a highly customized and responsive environment for coding, scripting, and system administration.

## Key Integrations

*   **Terminal Integration:** i3's ability to manage multiple terminal windows and layouts, combined with a powerful terminal emulator (e.g., Alacritty, Kitty), provides a seamless command-line experience.
*   **Neovim within i3:** Neovim's tiling nature complements i3's window management, allowing for efficient side-by-side coding, debugging, and terminal interaction.
*   **Tooling:** Integration of Kali's pre-installed security tools with Neovim's capabilities (e.g., using Neovim for script development, configuring tools, or analyzing output).

## Example Customizations

*   **i3 Keybindings:** Custom keybindings for launching specific applications, managing workspaces, and controlling windows.
*   **Neovim Plugins:** Curated set of plugins for language support (LSP), fuzzy finding (Telescope), Git integration (Fugitive), and more.
*   **Shell Configuration:** Zsh with powerline themes, custom aliases, and functions for enhanced productivity.

## Further Reading

*   [[Linux Customization]]
*   [[Kali]]
*   [[Linux Customization/i3/i3]]
*   [[Linux Customization/Neovim/Neovim]]
*   [[Linux Customization/Neovim/Lua Configuration]]
*   [[Dotfiles/Dotfiles]]
