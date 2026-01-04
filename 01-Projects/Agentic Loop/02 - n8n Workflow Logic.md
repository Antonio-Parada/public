# 02 - n8n Workflow Logic

This document outlines the step-by-step logic for the n8n workflow that powers the "Agentic Loop."

**Trigger:** GitHub Push Webhook

The workflow starts when GitHub sends a webhook to a dedicated n8n webhook URL. This happens on every push to the main branch of the repository.

---

### Step 1: GitHub Trigger Node

-   **Node:** `GitHub Trigger`
-   **Configuration:**
    -   **Authentication:** Connect your GitHub account.
    -   **Events:** `Push`
    -   **Repository:** Select your Obsidian vault repository.
-   **Output:** This node outputs JSON data containing information about the push, including a list of added, modified, and removed files.

### Step 2: Filter & Loop Through Modified Files

-   **Node:** `IF` or `Filter` Node
-   **Purpose:** We only want to process Markdown files (`.md`).
-   **Logic:** Check if the `modified` or `added` file list from the GitHub node contains any file paths ending with `.md`.

-   **Node:** `Split in Batches` or `Loop Over Items`
-   **Purpose:** To process each modified Markdown file individually.
-   **Input:** The list of `.md` files from the previous step.

### Step 3: Git Clone/Pull & Read File

-   **Node:** `Execute Command` (or a dedicated `Git` node if available)
-   **Purpose:** To get the most recent version of the vault content.
-   **Command:**
    1.  `git clone <your-repo-url> ./n8n-workdir` (if the directory doesn't exist).
    2.  `cd ./n8n-workdir && git pull` (if it does exist, to update it).
    -   *Note: This requires `git` to be installed on the n8n server.*

-   **Node:** `Read File`
-   **Purpose:** To read the content of the specific Markdown file being processed in the loop.
-   **File Path:** Construct the full path to the file within the cloned repository (e.g., `./n8n-workdir/path/to/note.md`).

### Step 4: Check `status` Frontmatter

-   **Node:** `Code` Node (or series of `IF` and `Function` nodes)
-   **Purpose:** To check if the note needs processing, based on the Agent Protocol.
-   **Logic:**
    1.  Parse the file content to extract the YAML frontmatter.
    2.  Check if `status` is equal to `needs-processing`.
    3.  If it is not, **stop the workflow for this item** to prevent unnecessary work.
    4.  If it is, immediately update the file on disk, changing the status to `status: processing`.

### Step 5: The AI Agent (LLM)

-   **Node:** `LLM Chain` or `OpenAI`/`Google AI` Node
-   **Purpose:** To analyze the note and generate the required insights.
-   **Input:** The full content of the note.
-   **Prompt:**
    ```
    You are an AI assistant for an Obsidian vault. Your task is to analyze the following note and generate metadata according to the established Agent Protocol.

    **Note Content:**
    {{ $json.file_content }}

    **Instructions:**
    1.  Read the note content carefully.
    2.  Generate a 1-2 sentence summary of the note.
    3.  Suggest 3-5 relevant tags (as a list).
    4.  Suggest 1-3 relevant internal [[WikiLinks]] to other potential notes.
    5.  Return ONLY a valid JSON object with the following structure:
        {
          "summary": "Your summary here.",
          "generated_tags": ["tag1", "tag2"],
          "generated_links": ["[[Link 1]]", "[[Link 2]]"]
        }
    ```

### Step 6: Update the Note File

-   **Node:** `Code` Node or `Edit File`
-   **Purpose:** To append the agent's output to the note, following the protocol.
-   **Logic:**
    1.  Take the JSON output from the LLM.
    2.  Read the current content of the note file (`.../path/to/note.md`).
    3.  **Update Frontmatter:**
        -   Change `status: processing` to `status: processed`.
        -   Add the `agent` block containing `last_processed`, `summary`, `generated_tags`, and `generated_links` from the LLM output.
    4.  **Append Body Content:**
        -   Append the `--- 

## Agentic Insights 

...` section to the end of the file.
    5.  Save the changes to the file on the n8n server's disk.

### Step 7: Commit and Push Changes

-   **Node:** `Execute Command`
-   **Purpose:** To commit the agent's changes back to the GitHub repository.
-   **Commands:**
    ```bash
    cd ./n8n-workdir
    git config --global user.name "AI Agent"
    git config --global user.email "agent@example.com"
    git add .
    git commit -m "chore(agent): Process and update note '{{ $json.file_name }}'"
    git push
    ```
-   **Important:** This step requires the n8n server to have write access to the repository (e.g., via an SSH key or a GitHub App).

This workflow ensures a robust, rule-based loop that respects the Agent Protocol and safely enhances your vault.
