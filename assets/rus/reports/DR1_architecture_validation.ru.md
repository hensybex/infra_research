# Пруф стека — Доказательная база мульти-оркестраторного инженерного стека

## 1. Клиентские тезисы
- OpenAI позиционирует AgentKit как бесшовный путь от прототипа к продакшену с встроенным Connector Registry — подтверждает нашу архитектуру «орchestrator + registry + evals» (Сэм Альтман, DevDay 2025) → {{doc:20251104_openai_agentkit_techcrunch|OpenAI AgentKit · TechCrunch}}.
- Azure AI Foundry от Microsoft называет MCP Anthropic «USB-C для AI-интеграций», тем самым узаконивая нашу мультипротокольную стратегию → {{doc:20251104_azure_foundry_mcp_infoq|Azure Foundry · MCP (InfoQ)}}.
- GitHub продаёт Agent HQ как миссионный центр по управлению агентами Anthropic/OpenAI/Google с Git-организацией — отражает нашу контрольную плоскость → {{doc:20251104_github_agent_hq_infoworld|GitHub Agent HQ · InfoWorld}}.
- AWS выводит Automated Reasoning guardrails, обещая 99% верифицированных ответов агентов для зарегулированных индустрий — клиенты ждут формальной проверки внутри оркестратора → {{doc:20251104_aws_bedrock_guardrails|AWS Bedrock · Guardrails}}.
- Три инженера Forethought обслуживают SupportGPT на 30M+ интеракций через SageMaker multi-model endpoints, доказывая, что компактные команды держат enterprise-уровень → {{doc:20251104_forethought_case_study|Forethought · case study}}.
- Команда Shisa.ai из трёх человек запустила японскую LLM на 405B параметров и вышла на 1M загрузок за месяц — оркестрация и кастомные датасорсы дают взрывную скорость → {{doc:20251104_asiatech_shisa|AsiaTech Shisa · AI stack}}.
- Ю.Корея выделяет ₩728T в «первый AI-бюджет» и удваивает вложения — инфраструктура ИИ становится вопросом выживания, а клиенты закладывают бюджеты под turnkey-команды → {{doc:20251104_cnbctv18_korea_budget_ai|CNBCTV18 · Korea AI budget}}.
- Meta готова удвоить AI-capex до $70–72B, даже сокращая free cash flow — партнёры хотят команд, превращающих инвестиции в готовые системы → {{doc:20251104_eweek_meta_ai_spending|eWeek · Meta AI spending}}.

## 2. Технологическое происхождение лучших практик
| Год/форум | Лидер | Практика | Почему важно |
| --- | --- | --- | --- |
| OpenAI DevDay 2025 | Сэм Альтман | AgentKit = визуальный билдер агентов, ChatKit, evals, Connector Registry | Подтверждает нашу архитектуру «workflow builder + registry + evals» ({{doc:20251104_openai_agentkit_techcrunch|OpenAI AgentKit · TechCrunch}}). |
| Azure Build 2025 | Капил Дхангер (Microsoft) | Поддержка MCP в Azure AI Foundry, «USB-C для AI-интеграций» | Усиливает тезис, что MCP + Codex/MCP-сервера становятся индустриальным стандартом ({{doc:20251104_azure_foundry_mcp_infoq|Azure Foundry · MCP (InfoQ)}}). |
| GitHub Universe 2025 | IDC / Forrester | Agent HQ как мультиагентный command center поверх Git, PR, CI/CD | Показывает, что предприятия ожидают слой оркестрации над вендорскими агентами ({{doc:20251104_github_agent_hq_infoworld|GitHub Agent HQ · InfoWorld}}; {{doc:20251104_github_agent_hq_infoworld|GitHub Agent HQ · InfoWorld}}). |
| AWS re:Invent 2024 → GA 2025 | AWS ML Org | Automated Reasoning для проверок guardrails | Подтверждает потребность в формальной верификации внутри стеков агентов ({{doc:20251104_aws_bedrock_guardrails|AWS Bedrock · Guardrails}}). |
| Запуск MCP Anthropic 2024 | Инженерная команда Anthropic | Открытие Model Context Protocol | Формирует открытый стандарт, уже используемый в наших Codex MCP-серверах ({{doc:20251104_anthropic_mcp|Anthropic · MCP launch notes}}). |

## 3. Компактные элитные команды, поставляющие AI-инфраструктуру
| Команда | Скорость | Что запустили | Ключ стека | Почему релевантно клиенту |
| Forethought (США) | Миграция inference < 1 года; поддержка 30M+ интеракций | SupportGPT для enterprise-саппорта, индивидуальные модели для клиентов | SageMaker multi-model endpoints + serverless; 3 инженера | Подтверждает, что наш дуэт выдержит надёжность уровня hyperscaler при минимальном штате ({{doc:20251104_forethought_case_study|Forethought · case study}} {{doc:20251104_forethought_case_study|Forethought · case study}}). |
| Shisa.ai (Япония) | 1 месяц от запуска до 1M загрузок | LLM на 405B параметров + голосовой агент в реальном времени | LLM с сообществом, релиз через Hugging Face, voice-first UX | Доказывает, что микро-команды обгоняют Big Tech в нишах благодаря оркестрации ({{doc:20251104_asiatech_shisa|AsiaTech Shisa · AI stack}} {{doc:20251104_asiatech_shisa|AsiaTech Shisa · AI stack}}). |
| Soile AI (Казахстан) | 6 месяцев от идеи до пилотов | Голосовой ассистент для терапии и клиник | Telegram-бот + веб + wearables; 4 студента | Показывает, что даже студенческие команды собирают health-агентов с правильной архитектурой ({{doc:20251104_thetech_almaty|TheTech · Almaty digital hub}} {{doc:20251104_thetech_almaty|TheTech · Almaty digital hub}}). |

## 4. Рыночные и ценовые сигналы
- Капвложения hyperscaler’ов: Meta увеличивает AI-capex до $70–72B; Google и Microsoft суммарно превышают $200B — растёт запрос на экспертизу по оркестрации ({{doc:20251104_eweek_meta_ai_spending|eWeek · Meta AI spending}} {{doc:20251104_eweek_meta_ai_spending|eWeek · Meta AI spending}}).
- Суверенный спрос: Ю.Корея выделяет ₩10.1T на AI в 2026 и объявляет инфраструктуру AI «дорогой выживания» — прямой запрос на turnkey-команды ({{doc:20251104_cnbctv18_korea_budget_ai|CNBCTV18 · Korea AI budget}} {{doc:20251104_cnbctv18_korea_budget_ai|CNBCTV18 · Korea AI budget}}).
- Бюджеты на guardrails: AWS инвестирует в automated reasoning, что говорит о финансировании формальных проверок у партнёров ({{doc:20251104_aws_bedrock_guardrails|AWS Bedrock · Guardrails}}).
- (В работе) Публичная ссылка о ставках консультантов: Fortune/VentureBeat упоминают $900/час для PromptQL; доступ к источнику пока закрыт → зафиксировано для последующего обновления.

## 5. Приложение — карта источников
- {{doc:20251104_openai_agentkit_techcrunch|OpenAI AgentKit · TechCrunch}}-165` — расшифровка доклада о AgentKit.
- {{doc:20251104_azure_foundry_mcp_infoq|Azure Foundry · MCP (InfoQ)}}-258` — анонс MCP и цитаты.
- {{doc:20251104_github_agent_hq_infoworld|GitHub Agent HQ · InfoWorld}}-374` — реакция аналитиков на Agent HQ.
- {{doc:20251104_anthropic_mcp|Anthropic · MCP launch notes}}-12` — аргументы в пользу открытого стандарта MCP.
- {{doc:20251104_aws_bedrock_guardrails|AWS Bedrock · Guardrails}}-24` — детали Automated Reasoning guardrails.
- {{doc:20251104_forethought_case_study|Forethought · case study}}-162` — кейс SupportGPT на SageMaker.
- {{doc:20251104_asiatech_shisa|AsiaTech Shisa · AI stack}}-28` — профиль микро-команды Shisa.ai.
- {{doc:20251104_thetech_almaty|TheTech · Almaty digital hub}}-48` — история Soile AI.
- {{doc:20251104_eweek_meta_ai_spending|eWeek · Meta AI spending}}-210` — анализ капзатрат Meta.
- {{doc:20251104_cnbctv18_korea_budget_ai|CNBCTV18 · Korea AI budget}}-207` — речь об AI-бюджете Ю.Корея.

**Дальнейшие шаги**
- Отследить открытый источник по ставкам консультантов PromptQL.
- Мониторить график поставок Nvidia–Корея по GPU для апдейта в Q1.
