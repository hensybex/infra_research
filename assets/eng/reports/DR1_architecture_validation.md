# Stack Proof — Proof Points for Multi-Orchestrator Engineering Stack

## 1. Executive Bulletproof (client-facing)
- OpenAI positions AgentKit as the frictionless path from prototype to production, with Connector Registry governance baked in (Sam Altman, DevDay 2025) → {{doc:20251104_openai_agentkit_techcrunch|OpenAI AgentKit · TechCrunch}}.
- Microsoft’s Azure AI Foundry now treats Anthropic’s MCP as “USB-C for AI integrations,” validating our multi-protocol orchestration stance → {{doc:20251104_azure_foundry_mcp_infoq|Azure Foundry · MCP (InfoQ)}}.
- GitHub Agent HQ is being sold as mission control for mixing Anthropic, OpenAI, Google agents under Git-era governance, mirroring our control-plane story → {{doc:20251104_github_agent_hq_infoworld|GitHub Agent HQ · InfoWorld}}.
- AWS is shipping Automated Reasoning guardrails to deliver 99% verified agent outputs for regulated industries—clients expect formal verification inside the orchestration stack → {{doc:20251104_aws_bedrock_guardrails|AWS Bedrock · Guardrails}}.
- Forethought’s 3-engineer infra team runs SupportGPT across 30M interactions using SageMaker multi-model endpoints, proving small squads can ship enterprise-grade agents with the right backbone → {{doc:20251104_forethought_case_study|Forethought · case study}}.
- Shisa.ai’s three-person “nano team” delivered a 405B-parameter Japanese LLM with 1M downloads in a month, underscoring velocity gains from tight orchestration and bespoke data taps → {{doc:20251104_asiatech_shisa|AsiaTech Shisa · AI stack}}.
- South Korea’s ₩728T “first AI-era budget” triples national AI spending and frames AI infrastructure as a survival imperative—buyers are budgeting for turnkey orchestrator teams → {{doc:20251104_cnbctv18_korea_budget_ai|CNBCTV18 · Korea AI budget}}.
- Meta is ready to double AI capex to $70–72B, even halving free cash flow, to secure orchestration advantages—clients expect partners who can translate that spend into shippable systems → {{doc:20251104_eweek_meta_ai_spending|eWeek · Meta AI spending}}.

## 2. Tech Lineage — Who is codifying best practice?
| Year/Forum | Leader | Practice | Why it Matters |
| --- | --- | --- | --- |
| 2025 OpenAI DevDay | Sam Altman | AgentKit = visual agent builder, ChatKit, evals, Connector Registry | Validates our “workflow builder + registry + evals” architecture ({{doc:20251104_openai_agentkit_techcrunch|OpenAI AgentKit · TechCrunch}}). |
| 2025 Azure Build cycle | Kapil Dhanger (Microsoft) | MCP support inside Azure AI Foundry; “USB-C for AI integrations” | Reinforces our claim that MCP + Codex/MCP servers are becoming the industry spine ({{doc:20251104_azure_foundry_mcp_infoq|Azure Foundry · MCP (InfoQ)}}). |
| 2025 GitHub Universe | IDC / Forrester analysts | Agent HQ as multi-agent command center over Git, PRs, CI/CD | Shows enterprises want orchestration layers over vendor-specific agents ({{doc:20251104_github_agent_hq_infoworld|GitHub Agent HQ · InfoWorld}}; {{doc:20251104_github_agent_hq_infoworld|GitHub Agent HQ · InfoWorld}}). |
| 2024 AWS re:Invent → 2025 GA | AWS ML Org | Automated Reasoning checks for agent guardrails | Confirms need for formal verification pathways in agent stacks ({{doc:20251104_aws_bedrock_guardrails|AWS Bedrock · Guardrails}}). |
| 2024 Anthropic MCP launch | Anthropic engineering team | Open-sourcing Model Context Protocol | Establishes open standard we already use for Codex MCP servers ({{doc:20251104_anthropic_mcp|Anthropic · MCP launch notes}}). |

## 3. Compact Elite Teams Delivering AI Infrastructure
| Team | Duration / Velocity | What They Shipped | Stack Highlights | Relevance to Client |
| Forethought (US) | Migrated inference in <1y; 30M+ interactions maintained | SupportGPT for enterprise support, on-demand per-customer models | SageMaker multi-model endpoints + serverless; 3-person infra team | Proves our duo can match hyperscaler-grade reliability with minimal headcount ({{doc:20251104_forethought_case_study|Forethought · case study}} {{doc:20251104_forethought_case_study|Forethought · case study}}). |
| Shisa.ai (JP) | 1 month from launch to 1M downloads | 405B-parameter Japanese LLM + real-time voice agent | Community-licensed large LLM, Hugging Face distribution, voice-first UX | Shows micro-teams can outpace Big Tech in niche markets via focused orchestration ({{doc:20251104_asiatech_shisa|AsiaTech Shisa · AI stack}} {{doc:20251104_asiatech_shisa|AsiaTech Shisa · AI stack}}). |
| Soile AI (KZ) | 6 months from idea to product pilots | Speech-recognition + therapy assistant for clinics | Telegram bot + web platform + wearables; 4-student team | Demonstrates inclusive-health agent stacks built by ultra-small teams with hustle ({{doc:20251104_thetech_almaty|TheTech · Almaty digital hub}} {{doc:20251104_thetech_almaty|TheTech · Almaty digital hub}}). |

## 4. Market & Pricing Signals
- Hyperscaler spending: Meta to $70–72B capex; Google/Microsoft push aggregate AI capex beyond $200B → premium appetite for orchestrator expertise ({{doc:20251104_eweek_meta_ai_spending|eWeek · Meta AI spending}} {{doc:20251104_eweek_meta_ai_spending|eWeek · Meta AI spending}}).
- Sovereign demand: South Korea budgets ₩10.1T for AI in 2026 and labels AI infrastructure a “national survival” highway → direct pull for turnkey teams ({{doc:20251104_cnbctv18_korea_budget_ai|CNBCTV18 · Korea AI budget}} {{doc:20251104_cnbctv18_korea_budget_ai|CNBCTV18 · Korea AI budget}}).
- Guardrail spend: AWS invests in automated reasoning guardrails, signaling compliance budgets will flow to teams that can operationalize formal verification ({{doc:20251104_aws_bedrock_guardrails|AWS Bedrock · Guardrails}}).
- (Open) Consultant rate citation pending: Fortune/VentureBeat reports $900/hr PromptQL retainers; source still gated → capture once accessible.

## 5. Appendix — Source Map
- {{doc:20251104_openai_agentkit_techcrunch|OpenAI AgentKit · TechCrunch}}-165` — DevDay AgentKit keynote transcript.
- {{doc:20251104_azure_foundry_mcp_infoq|Azure Foundry · MCP (InfoQ)}}-258` — MCP announcement + quotes.
- {{doc:20251104_github_agent_hq_infoworld|GitHub Agent HQ · InfoWorld}}-374` — Agent HQ analyst reactions.
- {{doc:20251104_anthropic_mcp|Anthropic · MCP launch notes}}-12` — MCP open standard rationale.
- {{doc:20251104_aws_bedrock_guardrails|AWS Bedrock · Guardrails}}-24` — Automated Reasoning guardrail deep dive.
- {{doc:20251104_forethought_case_study|Forethought · case study}}-162` — SupportGPT SageMaker case study.
- {{doc:20251104_asiatech_shisa|AsiaTech Shisa · AI stack}}-28` — Shisa.ai nano team profile.
- {{doc:20251104_thetech_almaty|TheTech · Almaty digital hub}}-48` — Soile AI team & traction.
- {{doc:20251104_eweek_meta_ai_spending|eWeek · Meta AI spending}}-210` — Meta capex analysis.
- {{doc:20251104_cnbctv18_korea_budget_ai|CNBCTV18 · Korea AI budget}}-207` — South Korea AI budget speech.

**Follow-ups**
- Track PromptQL / consultant rate citation once accessible.
- Watch Nvidia–Korea GPU delivery schedule for proof points in Q1 check-in.
