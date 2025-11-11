# Azure AI Foundry Agent Service — поддержка Model Context Protocol

> **Scrape context:** заметка InfoQ (Стиф-Ян Виггерс, 7 июля 2025) о появлении MCP в Azure AI Foundry Agent Service; оставлены только факты, полезные для интеграций.
>
> **Source:** [InfoQ](https://www.infoq.com/news/2025/07/azure-foundry-mcp-agents/) · 07.07.2025

## Ключевая новость
Microsoft включила поддержку Model Context Protocol (MCP) в Azure AI Foundry Agent Service, который вышел в GA в мае. Цель — упростить подключение агентов к корпоративным данным, рабочим процессам и системам знаний без самописных Azure Functions или плагинов под каждую систему.

## Что даёт MCP
- MCP — открытый JSON-RPC протокол, где «сервер» публикует инструменты/ресурсы один раз, а любой совместимый «клиент» (Foundry) автоматически их обнаруживает и вызывает.
- Архитекторы Microsoft называют MCP «USB-C для AI-интеграций»: подключил один раз — используешь везде, при этом запросы проходят через enterprise-контур Foundry (аудит, безопасность, BYO thread storage).

## Выгоды для команд
- **Быстрая интеграция:** подключение любого MCP-сервера (on-prem или SaaS) без дополнительного клея.
- **Enterprise-контроль:** реестр инструментов управляется из Foundry; политики резидентности и доступа соблюдаются автоматически.
- **Меньше обслуживания:** действия и знания, импортированные из MCP, синхронизируются автоматически, сокращая время на поддержку агентов.

## Контекст рынка
Google уже использует MCP через Vertex AI Agent Builder, Agent Development Kit и MCP Toolbox; AWS — через Bedrock Agents и open-source MCP-сервера для сервисов вроде ECS/EKS (питает Amazon Q). Microsoft увязывает апдейт с союзом с Anthropic и стратегией «open-by-design» (Build 2025), обещая MCP во всех ключевых продуктах — Windows 11, GitHub, Copilot Studio, Azure AI.

## Источники
- InfoQ — «Azure AI Foundry Agent Service Gains Model Context Protocol Support in Preview»
- Microsoft DevBlogs — «Announcing Model Context Protocol support preview in Azure AI Foundry Agent Service»
