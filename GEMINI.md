# GEMINI.md - Guidelines for LLM Agent Contribution to the Iidian Vault

This document outlines the principles and practices for the LLM agent contributing to the Iidian Obsidian vault. Adhering to these guidelines ensures consistency, maintainability, and effective knowledge organization.

## 1. Core Principles for Contribution

*   **Adherence to PARA Method:** Organize content strictly according to the PARA (Projects, Areas, Resources, Archives) method. New notes should be placed in the appropriate top-level directory (`Projects/`, `Areas/`, `Resources/`, `Archive/`).
*   **Contextual Awareness:** Before creating or modifying any note, thoroughly understand the existing content, structure, and conventions of the relevant directory and related notes.
*   **Clarity and Conciseness:** All content should be clear, easy to read, and to the point. Avoid unnecessary verbosity.
*   **Interlinking:** Actively create internal links (`[[Note Name]]`) to connect related concepts and notes within the vault. This builds a robust knowledge graph.
*   **Atomic Notes:** Each note should ideally focus on a single, distinct concept, idea, or piece of information. Break down complex topics into smaller, linked notes.
*   **No Redundancy:** Avoid duplicating information. Link to existing notes instead of re-writing content.
*   **Folder-based Atomic Notes:** When creating new atomic notes for concepts, tools, libraries, or any distinct topic, always create a dedicated subdirectory for that topic. The primary note should reside within this subdirectory and be named identically to the subdirectory (e.g., `Resources/Tools/NewTool/NewTool.md`). This practice facilitates future expansion with related sub-notes, examples, or configurations without cluttering parent directories.

## 2. Tool Usage Guidelines

The LLM agent has access to various tools to interact with the vault and external information. Use them judiciously:

*   **`google_web_search(query: str)`:**
    *   **Purpose:** For factual information, definitions, external resources, current events, and general research.
    *   **Best Practice:** Prioritize reputable and authoritative sources. Summarize findings concisely within the note, providing external links (`[Link Text](URL)`) to original sources where appropriate.
*   **`read_file(absolute_path: str)`, `read_many_files(paths: list[str])`:**
    *   **Purpose:** To understand existing content, verify information, gather context, and analyze vault structure.
    *   **Best Practice:** Always read relevant files and directories before making modifications or adding new content. Use `read_many_files` for broader context (e.g., all notes in a specific `Area`).
*   **`write_file(content: str, file_path: str)`, `replace(file_path: str, new_string: str, old_string: str)`:**
    *   **Purpose:** `write_file` for creating new notes; `replace` for precise modifications to existing notes.
    *   **Best Practice:** Ensure all changes align with the vault's established structure, content, and formatting conventions. Use `replace` with extreme caution, ensuring `old_string` provides sufficient context to prevent unintended changes.
*   **`list_directory(path: str)`, `glob(pattern: str)`:**
    *   **Purpose:** To navigate the vault structure, discover existing notes, and identify appropriate locations for new content.
    *   **Best Practice:** Use `list_directory` for direct directory contents. Use `glob` for finding specific types of files or patterns across directories (e.g., `glob('**/*.md', path='Areas/')` to find all markdown files in the Areas directory).

## 3. Markdown Formatting Conventions

Maintain a consistent and readable markdown style:

*   **Headings:**
    *   `# Note Title` (H1): Used only once per note, at the very top, matching the filename.
    *   `## Major Section` (H2): For main sections within a note.
    *   `### Sub-section` (H3): For sub-sections.
    *   `#### Further Sub-section` (H4): Use sparingly.
*   **Emphasis:**
    *   `**bold**` for strong emphasis.
    *   `*italics*` for slight emphasis or technical terms.
*   **Lists:**
    *   Unordered: Use `* ` or `- ` (e.g., `* Item 1`). Be consistent within a note.
    *   Ordered: Use `1. ` (e.g., `1. First item`).
*   **Code Blocks:** Use triple backticks (```````) for code. Specify the language for syntax highlighting (e.g., ````python`).
    ```python
    print("Hello, World!")
    ```
*   **Links:**
    *   Internal Vault Links: `[[Note Name]]` (e.g., `[[AI & LLMs]]`). Use the exact note name.
    *   External Links: `[Link Text](URL)` (e.g., `[Google](https://www.google.com)`).
*   **Tags:** Use `#tag` for categorization. Place tags at the end of the note or within the YAML frontmatter.
*   **YAML Frontmatter (Recommended):** For metadata at the top of the note.
    ```yaml
    ---
    tags: [concept, programming]
    aliases: [alias1, alias2]
    date: 2025-08-14
    ---
    ```
    Ensure proper YAML syntax (indentation, key-value pairs).

## 4. Self-Correction and Learning

The LLM agent is expected to continuously learn and adapt:

*   **Updating `GEMINI.md`:** If new best practices, tools, or formatting conventions are discovered (e.g., through web search or user feedback) that would benefit the vault, the LLM should propose updates to this `GEMINI.md` file. This can be done by suggesting a `replace` operation on `GEMINI.md` itself, explaining the rationale for the change.
*   **Error Analysis:** If a task fails or produces unexpected results, the LLM must analyze the error, identify the root cause, learn from it, and adjust its approach for future tasks.
*   **User Feedback:** Pay close attention to user feedback and incorporate it into future actions.

## 5. Vault Maintenance and Updates

To ensure the vault remains organized and discoverable, the LLM agent is responsible for maintaining key index and changelog files.

*   **`CHANGELOG.md`:**
    *   **Purpose:** To record significant modifications made by the LLM to the vault's structure, organization, or important content. This includes creating new core files (e.g., `persona.os.md`, `Vault Index.md`), major refactoring, or significant content additions/removals.
    *   **Location:** Root directory of the vault (`/home/super/Documents/idian/CHANGELOG.md`).
    *   **Format:** Markdown list, with each entry prefixed by the date of the change.
    *   **Procedure:** After *every new note creation* or any significant modification, append a new entry to `CHANGELOG.md` describing the change concisely. If `CHANGELOG.md` does not exist, create it.

*   **`Vault Index.md`:**
    *   **Purpose:** To maintain an up-to-date, high-level overview of the vault's structure and key contents.
    *   **Location:** Root directory of the vault (`/home/super/Documents/idian/Vault Index.md`).
    *   **Procedure:** After *every new note creation* or any change that alters the directory structure (e.g., new top-level folders, new sub-folders within Projects/Areas/Resources) or adds/removes significant notes that should be reflected in the index, the LLM *must* regenerate and update the `Vault Index.md` file. This involves re-scanning the relevant directories and updating the content of `Vault Index.md` to reflect the current state.

## 6. Knowledge Graph Enhancement

The LLM agent should actively enhance the vault's knowledge graph by intelligently applying internal `[[wikilinks]]` to connect concepts.

*   **Procedure for Wiki-Linking:**
    1.  **Consult User Persona:** Before initiating any knowledge graph enhancement or wikilinking, the LLM *must* read and understand the `persona.os.md` file. This document defines the user's interests, goals, and preferred workflow, which are crucial for intelligent decision-making.
    2.  **Identify Target Text:** When processing user-provided content (e.g., in `$tart.md`'s "Personalizing Your Vault" sections, or new notes), identify key concepts, entities, or phrases that could represent a note in the vault.
    3.  **Check for Existing Notes:** For each identified concept, perform a case-insensitive search across the vault's `.md` files to determine if a note with that exact name (or a common alias) already exists. Use `glob('**/*.md')` to get all markdown files, then `read_many_files` to check content, or `search_file_content` if more precise pattern matching is needed.
    4.  **Apply Wikilink (Weighted by Persona):** If an existing note is found, replace the identified concept in the original text with its `[[wikilink]]` equivalent (e.g., "Artificial Intelligence" becomes `[[Artificial Intelligence]]`). Prioritize linking concepts that are highly relevant to the user's interests and research priorities as defined in `persona.os.md`.
    5.  **Handle New Concepts (Weighted by Persona):** If a concept does not have an existing note, consider the following:
        *   If it's a significant, recurring concept *and* aligns with the user's persona/interests, propose creating a new atomic note for it.
        *   If it's a minor or one-off mention, do not create a link.
    6.  **Prioritize Existing Links:** Avoid creating duplicate links if a concept is already linked nearby.

## 7. Knowledge Expansion Strategy

The LLM agent will follow a tiered approach for expanding the vault's knowledge base, prioritizing relevance and depth based on the user's established interests and existing content.

*   **Tier 1: Document Current Usage (Libraries/Tools in Existing Projects)**
    *   **Purpose:** To capture and formalize knowledge about the tools and libraries actively used in the user's existing projects and areas. This ensures immediate practical relevance.
    *   **Focus:** Identifying specific libraries, frameworks, and runtimes implied by project files (e.g., `package.json`, `requirements.txt`, directory structures) or explicitly mentioned in `persona.os.md`.
    *   **Examples:** Python libraries (NumPy, Pandas, Matplotlib, Requests, Scikit-learn), JavaScript runtimes (Node.js), C++ STL, C# Base Class Library.

*   **Tier 2: Document Core Language Paradigms**
    *   **Purpose:** To deepen the understanding of each programming language by documenting its unique and defining characteristics, paradigms, and advanced features.
    *   **Focus:** Concepts that are fundamental to the language's design and common usage patterns, going beyond basic syntax.
    *   **Examples:** JavaScript (Asynchronicity, DOM Manipulation), C++ (Memory Management, Templates), C# (LINQ, Async/Await, Garbage Collector), Python (List Comprehensions, Decorators, Virtual Environments).

*   **Tier 3: Document New Relevant Libraries/Tools (Based on Areas of Interest)**
    *   **Purpose:** To proactively expand knowledge in the user's stated areas of interest by documenting new, important libraries and tools that may not yet be in active use but are highly relevant.
    *   **Focus:** Identifying leading libraries/tools in fields like AI/LLMs, Cybersecurity, Web Development, etc., as outlined in `persona.os.md`.
    *   **Examples:** Hugging Face Transformers, LangChain, Scapy, Nmap, Express.js, TensorFlow, PyTorch, Wireshark, React, Angular, Vue.js.

*   **Tier 4: Deep Dives into Specific Applications/Projects and Cross-Cutting Concerns**
    *   **Purpose:** To analyze and document how multiple technologies (libraries, frameworks, languages) integrate within real-world applications or to explore advanced, cross-cutting concepts that span multiple domains.
    *   **Focus:**
        *   **Application Analysis:** Documenting the architecture, key technologies, and interdependencies within specific projects (e.g., `roller-coaster-tycoon-web`).
        *   **Cross-Cutting Concepts:** Documenting topics like API Design Principles, Microservices Architecture, DevOps practices, specific algorithms, or advanced design patterns that apply broadly.
    *   **Examples:** Analyzing the tech stack of a specific web application, documenting a common microservice pattern, explaining advanced CI/CD pipelines.

The LLM agent will prioritize tasks within these tiers, generally moving sequentially, but may adapt based on explicit user directives or immediate project needs.