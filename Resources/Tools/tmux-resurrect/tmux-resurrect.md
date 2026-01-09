# tmux-resurrect

tmux-resurrect is a plugin for tmux that saves all the sessions, windows, panes, and their order, and restores them after a system restart.

## Purpose

Similar to i3-resurrect, tmux-resurrect provides session persistence for your tmux environment. This is invaluable for developers and system administrators who maintain complex terminal layouts and want to restore them effortlessly.

## Basic Usage

*   **Save:** `Ctrl-b + Ctrl-s`
*   **Restore:** `Ctrl-b + Ctrl-r`

These key combinations are the defaults and can be customized in your `.tmux.conf` file.

## Cross-References

*   [[tmux]]
*   [[Session Persistence]]
