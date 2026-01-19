# Tools Overview

This directory (`Resources/Tools/`) serves as a centralized repository for documentation related to specific software tools, frameworks, and utilities that are frequently used or referenced within the vault.

## Purpose

The primary purpose of this directory is to:

*   Provide atomic notes for individual tools, detailing their functionality, usage, and key features.
*   Serve as a quick reference for tools relevant to various projects, areas of interest, and learning paths.
*   Ensure consistency in how tools are documented across the vault.

## Organizational Principles

To maintain clarity and navigability, all tool-related notes within this directory adhere to the following structure:

*   **Dedicated Subdirectory:** Each tool must reside within its own dedicated subdirectory, named after the tool (e.g., `Tools/Metasploit/`).
*   **Main Note:** The primary documentation for the tool should be a Markdown file within its subdirectory, named identically to the subdirectory (e.g., `Tools/Metasploit/Metasploit.md`).
*   **Supporting Files:** Any supporting files (e.g., configuration examples, code snippets, images) related to the tool can be stored within its dedicated subdirectory.

## How to Add a New Tool

When adding documentation for a new tool:

1.  Create a new subdirectory under `Resources/Tools/` with the name of the tool (e.g., `mkdir Resources/Tools/NewTool`).
2.  Create a Markdown file within this new subdirectory, named after the tool (e.g., `touch Resources/Tools/NewTool/NewTool.md`).
3.  Populate the `NewTool.md` file with relevant information, following the atomic note principle.
4.  Ensure to wikilink the new tool from any relevant notes (e.g., project notes, area notes, or other tool notes).
5.  Inform the LLM agent to update the `Vault Index.md` and `CHANGELOG.md` to reflect the new tool.

## Examples of Tools Documented Here

*   [[BrowserTools-MCP/BrowserTools-MCP]]
*   [[Metasploit/Metasploit]]
*   [[pybind11/pybind11]]
*   [[SWIG/SWIG]]
*   [[kali-undercover/kali-undercover]]
*   [[Logseq/Logseq]]
*   [[Obsidian/Obsidian]]
*   [[Playwright/Playwright]]
