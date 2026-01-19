# Neovim

Neovim is a hyper-extensible Vim-based text editor that aims to improve the user experience, plugin capabilities, and integration with modern tools. It is a refactor of Vim, designed for extensibility and usability, particularly through its native Lua scripting capabilities.

## Why Neovim?

*   **Modern Vim:** Builds upon Vim's powerful modal editing paradigm with a focus on modern features and performance.
*   **Lua Extensibility:** Native support for Lua scripting allows for highly customizable configurations and powerful plugins.
*   **Built-in LSP:** Integrated Language Server Protocol (LSP) client provides intelligent code completion, diagnostics, and refactoring.
*   **Tree-sitter Integration:** Advanced syntax highlighting and structural text editing.
*   **Community-Driven:** Active development and a vibrant plugin ecosystem.

## Configuration Management: Dotfiles

Neovim's configuration is typically managed through plain text files, often referred to as [[Dotfiles/Dotfiles]]. These configuration files, primarily `init.lua` (or `init.vim` for Vimscript), define keybindings, plugins, themes, and editor behavior. They are frequently stored in a version-controlled dotfiles repository and symlinked to their appropriate locations on the system.

## "Chad Configuration" Overview

A "chad configuration" (e.g., NvChad, AstroNvim, LunarVim) refers to a pre-configured Neovim setup that provides a rich, out-of-the-box experience with a curated set of plugins, themes, and sensible defaults. These configurations aim to reduce the initial setup burden for users and offer a powerful IDE-like experience. They often heavily leverage [[Lua/Lua]] for their customization.

## Basic Usage

*   **Open File:** `nvim <filename>`
*   **Save File:** `:w`
*   **Quit Editor:** `:q`
*   **Save and Quit:** `:wq` or `:x`
*   **Navigation:** Use `h`, `j`, `k`, `l` for basic movement, and various Vim motions for advanced navigation.

## Related Concepts

*   [[Linux Customization]]
*   [[Dotfiles/Dotfiles]]
*   [[Lua/Lua]]
*   [[Text Editors]] (if a note exists or needs to be created)

## Further Reading

*   [Neovim Official Website](https://neovim.io/)
*   [Neovim Documentation](https://neovim.io/doc/)
*   [NvChad GitHub Repository](https://github.com/NvChad/NvChad) (Example "chad configuration")
