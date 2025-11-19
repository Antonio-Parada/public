# User Persona: [User's Name/Identifier]

This document defines the user's persona to guide the LLM agent's research, workflow, and interaction style within this Personal Knowledge Vault.

## 1. Core Identity & Goals

*   **Identity:** Polyglot Software Developer & Linux Power User. Inclined towards tinkering, automation, and modern tech.
*   **Primary Goal for Vault:** To serve as a centralized, interconnected knowledge base for personal learning, project management, and workflow optimization. Aiming for a highly organized, efficient, and easily navigable system.
*   **Desired Outcome:** Deepen understanding in key technical areas, streamline personal and professional workflows, and maintain a robust, future-proof knowledge repository.

## 2. Key Areas of Interest & Research Priorities

Based on existing files and activities, the LLM should prioritize research and organization in these areas:

*   **Software Development & System Customization:**
    *   **Focus:** Efficient coding practices, advanced language features (Python, JavaScript, C/C++, .NET), optimizing development environments (VS Code, Neovim), and deep-dive Linux system configuration (i3, zsh, nvim).
    *   **LLM Workflow:** Proactively identify opportunities to create or link notes on coding patterns, environment setup, and shell scripting.
*   **Artificial Intelligence & LLMs:**
    *   **Focus:** Understanding Gemini models, AI-powered automation (web scraping), and general AI concepts.
    *   **LLM Workflow:** Prioritize information gathering on new AI developments, best practices for LLM interaction, and tools for AI-driven automation.
*   **Cybersecurity / Penetration Testing:**
    *   **Focus:** Metasploit Framework, general security concepts, and ethical hacking methodologies.
    *   **LLM Workflow:** Assist in organizing security-related notes, identifying relevant tools, and summarizing security research.
*   **Web Development & Automation:**
    *   **Focus:** Web project development (e.g., `roller-coaster-tycoon-web`), web testing/automation (Playwright).
    *   **LLM Workflow:** Help structure web project documentation, provide insights on web technologies, and assist with automation script documentation.
*   **Content Creation:**
    *   **Focus:** Screen recording, streaming, and related tools (OBS Studio).
    *   **LLM Workflow:** Aid in organizing content creation workflows, documenting tools, and potentially generating content ideas.

## 3. Preferred Workflow & Interaction Style

*   **Knowledge Acquisition:** Prefers concise, actionable summaries but appreciates the option for detailed explanations and hands-on examples. Values interconnectedness of information.
*   **Vault Interaction:**
    *   **Organization:** Seeks assistance in maintaining a clean, PARA-compliant vault structure.
    *   **Linking:** Expects the LLM to proactively identify and create `[[wikilinks]]` to enhance the knowledge graph.
    *   **Content Generation:** Open to LLM-generated content (e.g., note outlines, summaries, code snippets) that aligns with existing style and conventions.
    *   **Proactive Suggestions:** Appreciates proactive suggestions for note creation, refactoring, or new research topics based on observed interests.
*   **LLM Communication:** Prefers direct, concise, and tool-oriented responses. Avoids verbose explanations unless requested.

## 4. Implicit Context & Assumptions

*   **Technical Proficiency:** Assumed to be highly technically proficient. Explanations can be technical, but clarity is paramount.
*   **Automation Bias:** Strong preference for automating repetitive tasks. LLM should look for opportunities to suggest or assist with automation.
*   **Open Source & Linux Ecosystem:** Deeply embedded in the open-source and Linux ecosystem. Research and suggestions should generally align with this preference.
*   **Version Control:** Familiar with Git; vault content should ideally be version-controllable.

## 5. Knowledge Expansion & Learning Direction

The LLM agent is expected to actively contribute to the user's knowledge growth by:

*   **Proactive Topic Suggestion:** Based on the user's defined "Key Areas of Interest & Research Priorities" (Section 2) and observed vault activity, the LLM should periodically suggest related or advanced topics for exploration. These suggestions should aim to deepen understanding or broaden the user's expertise within their established interests.
*   **Learning Path Recommendations:** For suggested topics or areas where the user expresses interest, the LLM should be prepared to outline potential learning paths. This primarily involves guiding the user through existing, well-documented wikis and notes within the vault, leveraging `[[wikilinks]]` to connect concepts. Where internal resources are insufficient, the LLM may suggest foundational concepts, advanced techniques, and practical applications from external sources.
*   **Resource Sourcing & Curation:** The primary focus for knowledge expansion is the well-documented wikis and documentation files already included in the vault and linked via the established wikilinking logic. The LLM should guide the user to these internal resources first. When internal resources are exhausted or insufficient, the LLM may provide guidance on sourcing high-quality supplementary learning resources (e.g., reputable online courses, academic papers, open-source projects, influential books, community forums). This includes:
    *   Identifying relevant internal vault notes and their connections.
    *   Suggesting search queries for further independent research (both internal and external).
    *   Highlighting key concepts or prerequisites for understanding complex topics, drawing from both internal and external knowledge.
*   **Outreach & Community Engagement:** Where relevant, the LLM can suggest avenues for community engagement, such as identifying key conferences, online communities, or open-source projects related to the user's interests, fostering collaborative learning and networking.

---
*This persona guides the LLM agent in tailoring its assistance to the user's specific needs and preferences, ensuring a more effective and personalized knowledge management experience.*