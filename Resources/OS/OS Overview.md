# OS Overview

This directory (`Resources/OS/`) serves as a centralized repository for documentation related to various operating systems.

## Purpose

The primary purpose of this directory is to:

*   Provide atomic notes for individual operating systems, detailing their features, configurations, and specific functionalities.
*   Serve as a quick reference for OS-related information relevant to various projects, areas of interest, and learning paths.
*   Ensure consistency in how operating systems are documented across the vault.

## Organizational Principles

To maintain clarity and navigability, all OS-related notes within this directory adhere to the following structure:

*   **Dedicated Subdirectory:** Each operating system must reside within its own dedicated subdirectory, named after the OS (e.g., `OS/Kali/`).
*   **Main OS Note:** The primary documentation for the OS should be a Markdown file within its subdirectory, named identically to the subdirectory (e.g., `OS/Kali/Kali.md`).
*   **Supporting Files:** Any supporting files (e.g., configuration examples, scripts, images) related to the OS can be stored within its dedicated subdirectory.

## How to Add a New Operating System

When adding documentation for a new operating system:

1.  Create a new subdirectory under `Resources/OS/` with the name of the OS (e.g., `mkdir Resources/OS/NewOS`).
2.  Create a Markdown file within this new subdirectory, named after the OS (e.g., `touch Resources/OS/NewOS/NewOS.md`).
3.  Populate the `NewOS.md` file with relevant information, following the atomic note principle.
4.  Ensure to wikilink the new OS from any relevant notes.
5.  Inform the LLM agent to update the `Vault Index.md` and `CHANGELOG.md` to reflect the new entry.

## Examples of Operating Systems Documented Here

*   [[Kali]]
