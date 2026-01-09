# Neovim Lua Configuration

Neovim's native Lua scripting capabilities allow for highly flexible and powerful customization. This note details how Lua configurations are structured, managed, and integrated within a Neovim setup, particularly in the context of dotfiles.

## 1. The `init.lua` File

The `init.lua` file is the entry point for Neovim's Lua configuration. It replaces the traditional `init.vim` (Vimscript) and is typically located at `~/.config/nvim/init.lua`. This file often loads other Lua modules, sets global options, and initializes plugin managers.

## 2. Plugin Management with Lua

Modern Neovim configurations heavily rely on Lua-based plugin managers. These managers simplify the process of installing, updating, and loading plugins.

*   **Lazy.nvim:** A popular, fast, and feature-rich plugin manager written in Lua.
    *   **Configuration Example:**
        ```lua
        -- ~/.config/nvim/init.lua
        local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
        if not vim.loop.fs_stat(lazypath) then
          vim.fn.system({
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable", -- latest stable release
            lazypath,
          })
        end
        vim.opt.rtp:prepend(lazypath)

        require("lazy").setup({
          -- your plugins go here
          "nvim-treesitter/nvim-treesitter",
          "neovim/nvim-lspconfig",
          -- etc.
        })
        ```

## 3. Organizing Custom Lua Modules

For larger configurations, it's best practice to organize custom Lua code into separate modules. These modules are typically placed in a `lua/` directory within your Neovim configuration (e.g., `~/.config/nvim/lua/`).

*   **Structure Example:**
    ```
    ~/.config/nvim/
    ├── init.lua
    └── lua/
        ├── user/
        │   ├── options.lua
        │   ├── keymaps.lua
        │   └── plugins.lua
        └── another_module/
            └── init.lua
    ```

*   **Loading Custom Modules:** You can load these modules from `init.lua` using `require()`.
    ```lua
    -- ~/.config/nvim/init.lua
    require("user.options") -- Loads lua/user/options.lua
    require("user.keymaps") -- Loads lua/user/keymaps.lua
    require("user.plugins") -- Loads lua/user/plugins.lua
    ```

## 4. Dotfiles Integration and Distributed File Structure

The entire `~/.config/nvim/` directory (or parts of it) is often managed as part of a [[Dotfiles/Dotfiles]] repository. This allows for version control, easy synchronization across multiple machines, and sharing configurations.

*   **Symlinking:** The common practice is to clone the dotfiles repository to a convenient location (e.g., `~/dotfiles/nvim`) and then create a symbolic link from `~/.config/nvim` to this location.
    ```bash
    # Example:
    # cd ~/.config
    # mv nvim nvim.bak # Backup existing config
    # ln -s ~/dotfiles/nvim nvim
    ```

## 5. Examples of Custom Lua Functionality

### Custom Keybinding

```lua
-- lua/user/keymaps.lua
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
```

### Autocommand

```lua
-- lua/user/autocmds.lua
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.lua",
  callback = function()
    print("Lua file saved!")
  end,
})
```

## Further Reading

*   [[Neovim/Neovim]]
*   [[Dotfiles/Dotfiles]]
*   [[Lua/Lua]]
*   [Neovim Lua Guide](https://neovim.io/doc/user/lua.html)
*   [Lazy.nvim GitHub](https://github.com/folke/lazy.nvim)
