# Azure AI Foundry Agent Service Gains Model Context Protocol Support in Preview

> **Scrape context:** InfoQ (Steef-Jan Wiggers, Jul 7 2025) reported on Microsoft adding Model Context Protocol (MCP) support to Azure AI Foundry Agent Service; this cleaned copy keeps the engineering-relevant facts without the InfoQ newsletter clutter.
>
> **Source:** [InfoQ](https://www.infoq.com/news/2025/07/azure-foundry-mcp-agents/) · Published 2025-07-07 10:00 UTC

## Overview
Microsoft added preview support for Anthropic’s Model Context Protocol to the Azure AI Foundry Agent Service, which itself became generally available in May. The goal is to remove the friction of wiring agents into enterprise data sources, workflows, and knowledge bases—historically a maze of custom Azure Functions, OpenAPI specs, or bespoke plugins.

## Why MCP matters
MCP is an open JSON-RPC protocol where a “server” publishes tools and resources once and any compliant “client” (like Azure AI Foundry) can automatically discover and invoke them. Microsoft architects liken it to “USB-C for AI integrations,” promising a “connect once, integrate anywhere” experience that keeps connectors updated automatically and routes calls through Azure’s enterprise security envelope.

## Benefits called out by Microsoft
- **Easy integration:** Bring any remote MCP server—self-hosted or SaaS—and import its capabilities into agents within seconds, no custom glue code required.
- **Enterprise-ready controls:** Foundry’s admin surface (including Bring Your Own thread storage) governs the imported tools so security, auditing, and residency policies stay intact.
- **Streamlined agent development:** Actions and knowledge pulled from MCP servers stay synchronized with minimal maintenance, shrinking the time to ship multi-system agents.

## Competitive context
Google Cloud already exposes MCP through Vertex AI Agent Builder, its Agent Development Kit, and the MCP Toolbox for Databases; AWS taps MCP via Bedrock Agents and open-source servers for services such as ECS/EKS that feed Amazon Q Developer. Microsoft pairs the Foundry update with its Anthropic partnership and the broader “open-by-design” messaging from Build 2025, signaling an intent to make MCP a standard across Windows 11, GitHub, Copilot Studio, and Azure AI properties.

## Sources
- InfoQ — “Azure AI Foundry Agent Service Gains Model Context Protocol Support in Preview” (Steef-Jan Wiggers, Jul 7 2025)
- Microsoft DevBlogs — “Announcing Model Context Protocol support preview in Azure AI Foundry Agent Service”
