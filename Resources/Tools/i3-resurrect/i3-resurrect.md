# i3-resurrect

i3-resurrect is a plugin for the i3 window manager that allows you to save and restore the layout of your workspaces.

## Purpose

The main purpose of i3-resurrect is to persist your i3 session across reboots. This means you can save the layout of all your open windows and applications, and then restore them to the same state later.

## Basic Usage

*   **Save layout:** `i3-save-tree --workspace <workspace_name> > ~/.config/i3/workspace.json`
*   **Restore layout:** `i3-msg 'workspace <workspace_name>; append_layout ~/.config/i3/workspace.json'`

Typically, these commands are bound to key combinations in your i3 configuration file.

## Cross-References

*   [[i3]]
*   [[Session Persistence]]
