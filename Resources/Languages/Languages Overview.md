# Languages Overview

This directory (`Resources/Languages/`) serves as a centralized repository for documentation related to programming languages, scripting languages, and their associated ecosystems.

## Purpose

The primary purpose of this directory is to:

*   Provide atomic notes for individual languages, detailing their syntax, paradigms, and key features.
*   Document language-specific tools, libraries, and concepts.
*   Serve as a quick reference for language-related information relevant to various projects, areas of interest, and learning paths.

## Organizational Principles

To maintain clarity and navigability, all language-related notes within this directory adhere to the following structure:

*   **Dedicated Subdirectory:** Each language must reside within its own dedicated subdirectory, named after the language (e.g., `Languages/Python/`).
*   **Main Language Note:** The primary documentation for the language should be a Markdown file within its subdirectory, named identically to the subdirectory (e.g., `Languages/Python/Python.md`).
*   **Language-Specific Concepts/Tools:** Concepts or tools highly specific to a language (e.g., `ctypes` for Python, `Python C API`) should reside in their own subdirectories within the language's directory (e.g., `Languages/Python/ctypes/ctypes.md`).
*   **Supporting Files:** Any supporting files (e.g., code snippets, examples) related to the language can be stored within its dedicated subdirectory.

## How to Add a New Language or Language-Specific Concept

When adding documentation for a new language or a concept specific to an existing language:

1.  Create a new subdirectory under `Resources/Languages/` with the name of the language (e.g., `mkdir Resources/Languages/NewLanguage`).
2.  Create a Markdown file within this new subdirectory, named after the language (e.g., `touch Resources/Languages/NewLanguage/NewLanguage.md`).
3.  For language-specific concepts/tools, create a subdirectory within the language's directory (e.g., `mkdir Resources/Languages/Python/NewConcept`).
4.  Populate the Markdown file(s) with relevant information, following the atomic note principle.
5.  Ensure to wikilink the new language or concept from any relevant notes.
6.  Inform the LLM agent to update the `Vault Index.md` and `CHANGELOG.md` to reflect the new entry.

## Examples of Languages and Concepts Documented Here

*   [[CPP]]
*   [[CSharp]]
*   [[JavaScript]]
*   [[Python]]
    *   [[Python/ctypes]]
    *   [[Python/Python C API]]
*   [[Python-C++ Interoperability]]
