# Concepts Overview

This directory (`Resources/Concepts/`) serves as a centralized repository for fundamental ideas, principles, methodologies, and abstract topics that are relevant across various domains within the vault.

## Purpose

The primary purpose of this directory is to:

*   Provide atomic notes for core concepts, detailing their definitions, principles, and applications.
*   Serve as a foundational knowledge base that can be referenced from projects, areas, and other resource notes.
*   Ensure consistent understanding and terminology for key ideas throughout the vault.

## Organizational Principles

To maintain clarity and navigability, all concept-related notes within this directory adhere to the following structure:

*   **Dedicated Subdirectory:** Each concept must reside within its own dedicated subdirectory, named after the concept (e.g., `Concepts/PARA Method/`).
*   **Main Note:** The primary documentation for the concept should be a Markdown file within its subdirectory, named identically to the subdirectory (e.g., `Concepts/PARA Method/PARA Method.md`).
*   **Supporting Files:** Any supporting files (e.g., diagrams, examples) related to the concept can be stored within its dedicated subdirectory.

## How to Add a New Concept

When adding documentation for a new concept:

1.  Create a new subdirectory under `Resources/Concepts/` with the name of the concept (e.g., `mkdir Resources/Concepts/NewConcept`).
2.  Create a Markdown file within this new subdirectory, named after the concept (e.g., `touch Resources/Concepts/NewConcept/NewConcept.md`).
3.  Populate the `NewConcept.md` file with relevant information, following the atomic note principle.
4.  Ensure to wikilink the new concept from any relevant notes.
5.  Inform the LLM agent to update the `Vault Index.md` and `CHANGELOG.md` to reflect the new entry.

## Examples of Concepts Documented Here

*   [[Atomic Notes]]
*   [[Dotfiles/Dotfiles]]
*   [[Interlinking]]
*   [[PARA Method/PARA Method]]
*   [[Tags]]
*   [[Vault Organization/Vault Organization]]
