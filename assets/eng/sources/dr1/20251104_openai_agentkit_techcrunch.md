# OpenAI launches AgentKit to help developers build and ship AI agents

> **Scrape context:** TechCrunch’s Rebecca Bellan covered OpenAI Dev Day (Oct 6 2025) where Sam Altman debuted AgentKit; this digest keeps the useful product details without TechCrunch’s site chrome.
>
> **Source:** [TechCrunch](https://www.techcrunch.com/2025/10/06/openai-launches-agentkit-to-help-developers-build-and-ship-ai-agents/) · Published 11:00 AM PDT on 2025-10-06

## Dev Day reveal
OpenAI CEO Sam Altman framed AgentKit as “a complete set of building blocks … to help you take agents from prototype to production,” positioning it alongside the new ability to build apps directly inside ChatGPT (now at 800 million weekly active users). The announcement is meant to keep OpenAI ahead of rival stacks by giving builders an end-to-end workflow rather than disconnected APIs.

## What AgentKit includes
- **Agent Builder:** A Canva-style canvas atop the Responses API so teams can visually choreograph logic, steps, and orchestration without hand-coding every branch.
- **ChatKit:** Embeddable chat components that let developers drop OpenAI-class chat UX (with their own branding and workflows) into existing products.
- **Evals for Agents:** Trace-level grading, component datasets, automated prompt optimization, and the option to run evaluations against external models directly from the OpenAI platform.
- **Connector registry + admin panel:** A governed catalog of internal/third-party integrations so admins can control which systems agents can call while preserving enterprise security controls.

## Demo and adoption proof
OpenAI engineer Christina Huang built two agents and a full workflow live onstage in under eight minutes to show the builder’s speed. Altman said multiple launch partners are already scaling production agents on AgentKit, underscoring that it’s meant for real deployments, not just demos.

## Why it matters for Infra App research
- Sets the expectation that modern agent platforms bundle low-code builders, eval tooling, and connector registries—exactly the combo we need to mirror in DR1/DR2 narratives.
- Reinforces the value of governance surfaces (admin panels, connector policies) when pitching compliance-conscious infra providers.

## Sources
- TechCrunch — “OpenAI launches AgentKit to help developers build and ship AI agents” (Rebecca Bellan, Oct 6 2025)
