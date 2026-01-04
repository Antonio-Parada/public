---
tags:
  - MOC
---
# 01 - Agent Protocol

This document outlines the "Rules of Engagement" for an AI agent operating within this Obsidian vault. The protocol ensures that automated processes are predictable, non-destructive, and aligned with the principles of PARA and Atomic Note-taking.

## Core Principles

1.  **Non-Destructive**: The agent **must never** delete or overwrite user-generated content. Its contributions are append-only or limited to specific, agent-owned fields.
2.  **Explicit Triggering**: The agent only acts on notes that explicitly request processing through a defined `status` field in the frontmatter.
3.  **Structured Output**: All agent-generated output must conform to a strict, predictable format, both in the frontmatter and the note body.
4.  **Idempotency**: Running the agent multiple times on a note that has already been processed should result in no new changes.

---

## 1. The Trigger: Frontmatter `status` Field

The primary mechanism for flagging a note for agent processing is the `status` field in the YAML frontmatter.

-   `status: needs-processing`
    -   **Meaning**: This is the primary trigger. The user sets this status to add the note to the agent's queue.
    -   **Agent Action**: The agent will process this file. Upon starting, it **must** immediately change the status to `status: processing`.

-   `status: processing`
    -   **Meaning**: The note is actively being processed by the agent.
    -   **Agent Action**: This is a lock. If an agent encounters a note with this status, it should skip it to prevent race conditions or duplicate work.

-   `status: processed`
    -   **Meaning**: The agent has successfully completed its work on this note.
    -   **Agent Action**: The agent sets this status upon completion. It will not touch this note again unless the status is manually changed back by the user.

## 2. The Sandbox: Permitted Zones for Modification

The agent's ability to modify a note is strictly limited to the following "sandbox" areas.

### Zone 1: The `agent` Frontmatter Block

The agent is permitted to write to a dedicated `agent` block within the YAML frontmatter. This keeps its data neatly namespaced.

**Example:**

```yaml
---
status: processed
agent:
  last_processed: 2026-01-03T14:00:00Z
  summary: "This note details the architecture for a wireless ADB control application, focusing on device preparation and script design."
  generated_tags:
    - adb
    - android
    - automation
  generated_links:
    - "[[#02. Script Architecture]]"
    - "[[Wireless ADB]]"
---
```

**Permitted Fields:**
-   `agent.last_processed`: An ISO 8601 timestamp of when the agent last processed the file.
-   `agent.summary`: A 1-2 sentence summary of the note's content.
-   `agent.generated_tags`: A list of suggested tags (not automatically added to the main `tags` field).
-   `agent.generated_links`: A list of suggested `[[WikiLinks]]` to other notes.

### Zone 2: The "Agentic Insights" Section (Append-Only)

The agent **must not** modify any other part of the note body. It is, however, allowed to **append** a dedicated section at the very end of the file. This section must be clearly demarcated.

**Format:**

The agent should add the following structure to the end of a note. A `---` horizontal rule provides a clear visual and machine-readable separator.

```markdown

---

## Agentic Insights

**Generated Summary:**
This note details the architecture for a wireless ADB control application, focusing on device preparation and script design for screen casting and control on a Hyprland-based system.

**Suggested Connections:**
- [[#02. Script Architecture]]
- [[Wireless ADB]]
- [[01-Projects/ADB/ADB]]

```

This append-only approach ensures that the user's original thoughts are preserved, while the agent's contributions are clearly separated and identifiable.
