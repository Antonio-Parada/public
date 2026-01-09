# tmux

tmux is a terminal multiplexer. It lets you switch easily between several programs in one terminal, detach them (they keep running in the background) and reattach them to a different terminal.

## Key Features

*   **Sessions:** A tmux session is a collection of windows. You can have multiple sessions and switch between them.
*   **Windows:** A window is a single screen in a tmux session. You can have multiple windows in a session.
*   **Panes:** A pane is a rectangular region within a window. You can split a window into multiple panes.

## Basic Commands

*   `tmux new -s <session_name>`: Start a new tmux session.
*   `tmux attach -t <session_name>`: Attach to an existing session.
*   `tmux ls`: List existing sessions.

Within a tmux session (using the default prefix `Ctrl-b`):

*   `Ctrl-b d`: Detach from the current session.
*   `Ctrl-b %`: Split the current pane vertically.
*   `Ctrl-b "`: Split the current pane horizontally.
*   `Ctrl-b <arrow_key>`: Navigate between panes.

## Cross-References

*   [[Linux Customization]]
*   [[Zsh]]
