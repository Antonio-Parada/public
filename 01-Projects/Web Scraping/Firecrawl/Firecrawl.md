# Firecrawl

Firecrawl is an open-source, AI-powered website documentation scraper that converts entire websites into structured markdown files. It is designed for self-hosting and provides multiple interfaces for interaction.

## Project Overview

Firecrawl aims to provide a comprehensive solution for extracting and structuring web content, particularly documentation, using advanced AI models. It emphasizes consistency, security, and maintainability through containerization.

## Technology Stack

### Core Languages
*   [[JavaScript/JavaScript]] (Primary language for API and UI)
*   [[TypeScript/TypeScript]] (Used for type safety in API and UI)
*   [[Python/Python]] (Used for SDKs and potentially some backend components)

### Backend (API Service)
*   **Runtime:** [[JavaScript/Runtime/Node.js/Node.js]]
*   **Framework:** [[JavaScript/Frameworks/Express.js/Express.js]]
*   **Queue Management:** [[Resources/Languages/JavaScript/Libraries/BullMQ/BullMQ]] (for background jobs), [[Resources/Tools/Redis/Redis]] (as message broker)
*   **AI/LLM Integrations:** [[Resources/Languages/JavaScript/Libraries/AI SDK/AI SDK]] (unified API for various LLM providers), [[Resources/Languages/JavaScript/Libraries/Anthropic AI SDK/Anthropic AI SDK]], [[Resources/Languages/JavaScript/Libraries/Cohere/Cohere]], [[Resources/Languages/JavaScript/Libraries/Ollama AI Provider/Ollama AI Provider]], [[Resources/Languages/JavaScript/Libraries/OpenAI SDK/OpenAI SDK]].
*   **Web Scraping/Parsing:** [[Resources/Languages/JavaScript/Libraries/Cheerio/Cheerio]] (for HTML parsing), [[Resources/Languages/JavaScript/Libraries/JSDOM/JSDOM]] (for DOM manipulation), [[Resources/Languages/JavaScript/Libraries/Turndown/Turndown]] (HTML to Markdown), [[Resources/Languages/JavaScript/Libraries/Turndown Plugin GFM/Turndown Plugin GFM]].
*   **Utilities:** [[Resources/Languages/JavaScript/Libraries/Winston/Winston]] (logging), [[Resources/Languages/JavaScript/Libraries/Zod/Zod]] (schema validation), [[Resources/Languages/JavaScript/Libraries/Sentry/Sentry]] (error tracking), [[Resources/Languages/JavaScript/Libraries/OpenTelemetry/OpenTelemetry]] (observability), [[Resources/Languages/JavaScript/Libraries/Supabase/Supabase]] (client), [[Resources/Languages/JavaScript/Libraries/Axios/Axios]] (HTTP client), [[Resources/Languages/JavaScript/Libraries/Bottleneck/Bottleneck]] (rate limiting), [[Resources/Languages/JavaScript/Libraries/cron-parser/cron-parser]] (scheduling), [[Resources/Languages/JavaScript/Libraries/Marked/Marked]] (Markdown parser), [[Resources/Languages/JavaScript/Libraries/Mammoth/Mammoth]] (.docx parsing), [[Resources/Languages/JavaScript/Libraries/pdf-parse/pdf-parse]] (PDF parsing), [[Resources/Languages/JavaScript/Libraries/uuid/uuid]] (UUID generation), [[Resources/Languages/JavaScript/Libraries/xml2js/xml2js]] (XML processing).
*   **Observability/Analytics:** [[Resources/Languages/JavaScript/Libraries/Langfuse/Langfuse]], [[Resources/Languages/JavaScript/Libraries/PostHog Node.js/PostHog Node.js]].

### Frontend (Ingestion UI)
*   **Framework:** [[JavaScript/Frameworks/React/React]]
*   **Build Tool:** [[Resources/Languages/JavaScript/Libraries/Vite/Vite]]
*   **Styling:** [[Tailwind CSS/Tailwind CSS]] (with [[Resources/Tools/PostCSS/PostCSS]], [[Resources/Tools/Autoprefixer/Autoprefixer]]), [[Resources/Languages/JavaScript/Libraries/Radix UI/Radix UI]] (component library), [[Resources/Languages/JavaScript/Libraries/Class Variance Authority/Class Variance Authority]], [[Resources/Languages/JavaScript/Libraries/clsx/clsx]], [[Resources/Languages/JavaScript/Libraries/Tailwind Merge/Tailwind Merge]].
*   **Icons:** [[Resources/Languages/JavaScript/Libraries/Lucide React/Lucide React]]
*   **Language:** [[TypeScript/TypeScript]]

### Playwright Service
*   **Purpose:** Handles browser automation for scraping.
*   **Technology:** Likely TypeScript/Node.js with [[Playwright/Playwright]] library.

### Overall Orchestration & Deployment
*   **Containerization:** [[Resources/Concepts/Containerization/Docker/Docker]]
*   **Multi-Container Management:** [[Resources/Concepts/Containerization/Docker/Docker Compose/Docker Compose]]
*   **Package Manager:** [[Resources/Tools/pnpm/pnpm]] (for monorepo management)
*   **Cluster Deployment (Optional):** Kubernetes (mentioned in docs).

### Python Libraries (from `requirements.txt`)
*   **AI/LLM:** [[Resources/Languages/Python/Libraries/ScrapeGraph AI/ScrapeGraph AI]], [[Resources/Languages/Python/Libraries/Google Generative AI/Google Generative AI]].
*   **Web Scraping/Parsing:** [[Resources/Languages/Python/Libraries/BeautifulSoup/BeautifulSoup]], [[Resources/Languages/Python/Libraries/lxml/lxml]].
*   **CLI:** [[Resources/Languages/Python/Libraries/rich/rich]], [[Resources/Languages/Python/Libraries/click/click]], [[Resources/Languages/Python/Libraries/Typer/Typer]].
*   **Data Processing:** [[Resources/Languages/Python/Libraries/Pandas/Pandas]], [[Resources/Languages/Python/Libraries/NumPy/NumPy]].
*   **State Management/Utilities:** [[Resources/Languages/Python/Libraries/Pydantic/Pydantic]], [[Resources/Languages/Python/Libraries/python-dotenv/python-dotenv]], [[Resources/Languages/Python/Libraries/PyYAML/PyYAML]].
*   **Testing:** [[Resources/Languages/Python/Libraries/Pytest/Pytest]], [[Resources/Languages/Python/Libraries/pytest-mock/pytest-mock]], [[Resources/Languages/Python/Libraries/pytest-asyncio/pytest-asyncio]].

## Project Structure (Monorepo)

Firecrawl uses a monorepo structure, with key applications located under the `apps/` directory:
*   `apps/api`: The main backend API service.
*   `apps/ui/ingestion-ui`: The primary web-based user interface.
*   `apps/playwright-service-ts`: The dedicated service for browser automation.
*   `apps/js-sdk`, `apps/python-sdk`, `apps/rust-sdk`: Language-specific SDKs.

## Self-Hosting & Deployment

Firecrawl is designed for self-hosting, primarily using Docker and Docker Compose. Key steps involve:
1.  Installing Docker.
2.  Setting up environment variables in a `.env` file.
3.  Building and running containers using `docker compose build` and `docker compose up`.

## Use Cases

*   Comprehensive website crawling and content extraction.
*   Converting web content to structured markdown.
*   Building AI-powered documentation systems.

## Cross-References

*   [[AI & LLMs/AI & LLMs]]
*   [[Web Scraping]] (if created)
*   [[Software Development/Software Development]]
