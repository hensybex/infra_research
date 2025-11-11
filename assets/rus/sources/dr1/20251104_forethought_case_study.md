# Forethought снизила расходы на ИИ, перейдя на Amazon SageMaker

> **Scrape context:** кейс AWS (17 октября 2025) о миграции Forethought Technologies с Amazon EKS на SageMaker для инференса SupportGPT.
>
> **Source:** [AWS Case Study](https://aws.amazon.com/solutions/case-studies/forethought-technologies-case-study/)

## О компании
- **Forethought** — разработчик SupportGPT, генеративного ассистента, обрабатывающего >30 млн обращений в службу поддержки ежегодно.
- Инфраструктурная команда — всего 3 инженера, поэтому нужны управляемые сервисы и оптимизация GPU.

## Почему SageMaker
- Обучение уже шло в AWS, но инференс жил в Amazon EKS, что усложняло управление десятками кастомных моделей подрядчиков.
- SageMaker даёт управляемые эндпоинты, мульти-модельные развертывания и serverless-инференс, снимая нагрузку с команды.

## Что поменяли
1. **Перенесли инференс** на **SageMaker Multi-Model Endpoints**, чтобы делить GPU между множеством моделей и улучшить масштабирование.
2. **Малые классификаторы** (приоритизация тикетов и т.п.) перевели на **SageMaker Serverless Inference**, исключив управление инстансами.
3. Автоматизировали пайплайны обучения, чтобы продуктовые команды могли самостоятельно переобучать модели.

## Результаты
- **Экономия до 66%** на нагрузках, работающих через MME, и **≈80%** — на классификаторах в serverless.
- **Меньше инцидентов:** SageMaker берёт на себя отказоустойчивость и память, инженеры перестали «тушить пожары» в Kubernetes.
- **80% GPU-инференса** теперь работает на SageMaker, позволяя команде концентрироваться на продукте.

## Поддержка AWS
- Forethought состоит в AWS Global Startup Program и продаёт решения через AWS Marketplace, получая пресейл и архитектурную поддержку.

## Источник
- AWS — «Optimizing Costs and Performance for Generative AI Using Amazon SageMaker with Forethought Technologies»
