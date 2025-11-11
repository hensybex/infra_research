# Introducing the Model Context Protocol (MCP)

> **Scrape context:** Anthropic announcement (Nov 2025) describing the open-source Model Context Protocol, its components, and early adopters.
>
> **Source:** [Anthropic](https://www.anthropic.com/news/model-context-protocol)

## What MCP solves
- AI assistants remain siloed from enterprise systems, forcing custom connectors for every repo, SaaS app, or database.
- MCP is an open, JSON-RPC–based standard so “servers” expose tools/resources once and any compliant “client” (Claude, custom agents, IDEs) can securely discover and call them.

## Launch package
- **Specification & SDKs:** reference docs plus client/server libraries on GitHub.
- **Claude Desktop support:** local MCP server connections built directly into Claude 3.5 Sonnet-powered desktop apps.
- **Open-source server repo:** ready-made connectors for Google Drive, Slack, GitHub, Git, Postgres, Puppeteer, etc., plus scaffolding for new integrations.

## Adoption signals
- Early users like Block and Apollo already wired MCP into production systems to let agents fetch context across tools.
- Dev-tool vendors (Zed, Replit, Codeium, Sourcegraph) are building MCP support so coding agents can keep context as they jump between repos and docs.
- Claude 3.5 Sonnet can rapidly scaffold new MCP servers, lowering the barrier for teams to expose internal datasets.

## Getting started
1. Install the Claude Desktop app and connect one of the pre-built servers or spin up your own via the quickstart guide.
2. Use the open-source repos to contribute new servers/resources that benefit the broader ecosystem.
3. Enterprises can start locally (Claude for Work) and Anthropic promises production-ready deployment kits for organization-wide MCP servers.

## Open community commitment
Anthropic frames MCP as a collaborative standard: feedback, connectors, and implementations are encouraged from tool builders, enterprises, and hobbyists so agents can carry context across silos.

## Sources
- Anthropic Newsroom — “Introducing the Model Context Protocol”
