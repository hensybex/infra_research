# Case Study: Forethought Cuts ML Costs with Amazon SageMaker

> **Scrape context:** AWS customer story (Oct 17 2025) about Forethought Technologies migrating ML inference from Amazon EKS to SageMaker.
>
> **Source:** [AWS Case Study](https://aws.amazon.com/solutions/case-studies/forethought-technologies-case-study/)

## Company snapshot
- **Forethought** builds SupportGPT, a generative AI suite automating 30 M+ customer-support interactions per year.
- Tiny infra team (3 engineers) needed better availability and lower inference costs as the customer base grew.

## Why SageMaker
- Forethought already trained models on AWS but served inference via Amazon EKS. Scaling dozens of customer-specific models stretched the team and GPU budget.
- SageMaker offers managed infra, multi-model endpoints, and serverless inference so the team can focus on product workflows.

## Architecture changes
1. **Migrated inference/hosting** from EKS to **SageMaker multi-model endpoints (MME)** so multiple models share a single GPU endpoint.
2. **Adopted SageMaker Serverless Inference** for lightweight classifiers (ticket priority, routing) tuned per customer.
3. Automated data + training pipelines so internal teams can trigger retraining without infra engineers babysitting jobs.

## Results
- **Cost savings:** up to **66%** reduction for workloads on MME and **≈80%** savings for classifiers moved to Serverless Inference.
- **Better latency & availability:** SageMaker manages failover and memory isolation, eliminating most manual firefighting.
- **Scale with tiny team:** 80% of GPU inference now runs on SageMaker services, freeing engineers to ship new features instead of patching clusters.

## Program support
- Forethought participates in the AWS Global Startup Program and lists its product on AWS Marketplace, using co-selling support plus solution architects to optimize deployments.

## Sources
- AWS Solutions Library — “Optimizing Costs and Performance for Generative AI Using Amazon SageMaker with Forethought Technologies”
