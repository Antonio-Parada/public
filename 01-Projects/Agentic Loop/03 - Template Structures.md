# 03 - Template Structures

This document provides the ideal template structure for "Project" and "Resource" notes. These templates are designed to be easily parsed by both humans and the AI agent, ensuring that the Agent Protocol can be applied effectively.

---

## Core Principles of Templates

-   **Clear Frontmatter:** The YAML frontmatter is the "control panel" for the note. It should contain all key metadata.
-   **Agent-Ready Status:** The `status` field is included by default, making it easy to flag a note for processing.
-   **Atomic Content:** The body of the note should be focused on a single topic, project, or resource.

---

## Template 1: Standard Project Note

This template should be used for any new project being tracked in the vault. It's designed to capture the project's lifecycle and key connections.

**File Name:** `Project - [Project Name].md`
**Location:** `01-Projects/`

```markdown
---
# --- METADATA ---
# Type of note
type: project
# Date of creation
created: {{date:YYYY-MM-DD}}
# Aliases for easier linking
aliases: []
# Tags for categorization
tags:
  - project

# --- AGENT CONTROL ---
# Status for the AI Agent (needs-processing, processing, processed)
status: needs-processing

# --- PROJECT METADATA ---
# High-level goal or objective
project_goal: 
# Current state of the project (e.g., planning, active, on-hold, completed)
project_status: planning
# Key deadlines or dates
due_date: 

# --- RELATIONSHIPS ---
# Links to related areas
related_areas: []
# Links to supporting resources
related_resources: []
---

# Project: {{title}}

## 🎯 Goal

-   What is the desired outcome of this project?

## 📝 Next Actions

-   [ ] Actionable step 1
-   [ ] Actionable step 2

## 🧠 Notes & Brainstorming

-   

## 📚 Resources

-   

```

### How the Agent Uses This Template:

1.  **Reads `status`:** Sees `needs-processing` and starts its process.
2.  **Analyzes Content:** Reads the `project_goal`, `Next Actions`, and `Notes` sections to understand the project's purpose.
3.  **Writes to Frontmatter:** Populates the `agent:` block with a summary and suggested links/tags.
4.  **Appends to Body:** Adds the `## Agentic Insights` section at the end of the file.

---

## Template 2: Standard Resource Note

This template is for capturing information about a specific resource, such as an article, book, video, or website.

**File Name:** `Resource - [Resource Title].md`
**Location:** `03-Resources/`

```markdown
---
# --- METADATA ---
type: resource
created: {{date:YYYY-MM-DD}}
aliases: []
tags:
  - resource

# --- AGENT CONTROL ---
status: needs-processing

# --- RESOURCE METADATA ---
# Author or creator
author: 
# URL or source link
source_url: 
# Type of resource (e.g., article, book, video, documentation)
resource_type: 

# --- RELATIONSHIPS ---
# Links to projects this resource supports
related_projects: []
---

# Resource: {{title}}

## 📝 Summary of Key Points

-   

## 💡 My Thoughts & Insights

-   How does this apply to my work?
-   What are the main takeaways?

## Quotes

> 

```

### How the Agent Uses This Template:

1.  **Reads `status`:** Sees `needs-processing` and triggers.
2.  **Analyzes Content:** Reads the `Summary of Key Points` and `My Thoughts & Insights` to grasp the resource's content and its relevance to you. If the body is empty but there's a `source_url`, a more advanced agent could be configured to fetch and summarize the URL's content.
3.  **Writes to Frontmatter:** Populates the `agent:` block.
4.  **Appends to Body:** Adds the `## Agentic Insights` section with a generated summary and connections to relevant projects or other resources.
