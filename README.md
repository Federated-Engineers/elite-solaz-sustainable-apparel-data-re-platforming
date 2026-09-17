# Elite Solaz Sustainable Apparel Data Re-platforming

A data platform modernization project for Solaz, focused on consolidating apparel, sales, and inventory signals into a Snowflake-based analytics environment. The repository combines infrastructure-as-code, dbt transformations, and deployment automation to support a medallion-style data model for omnichannel reporting.

## Overview

This project brings together data from multiple operational systems and formats, including:

- PostgreSQL source systems
- Google Sheets operational orders
- S3 RFID scan telemetry
- Snowflake as the analytics warehouse
- dbt for transformation, testing, and documentation
- Terraform for infrastructure provisioning and environment management

The result is a model layer that supports customer, product, inventory, and sales analytics across channels, with downstream marts optimized for profitability and operational insight.

## Architecture

The repository is organized around a modern data platform pattern:

- **Bronze:** source-linked storage and raw tables in Snowflake
- **Silver:** cleaned, standardized staging models
- **Gold:** curated dimensions, facts, and business marts
- **IaC:** Terraform for Snowflake and dbt Cloud infrastructure
- **Orchestration:** dbt Cloud project definitions and environment metadata

## Repository structure

```text
.
├── .github/                       # GitHub automation and repo metadata
├── .gitignore                     # Standard ignore rules
├── .sqlfluff                      # SQL formatting and linting configuration
├── README.md                      # Project documentation
├── requirements.txt               # Python dependencies for SQL linting
├── requirements_dev.txt           # dbt Snowflake development dependency
├── dbt_cloud_infra/               # Terraform for dbt Cloud resources
│   ├── backend.tf
│   ├── connection.tf
│   ├── credentials.tf
│   ├── data.tf
│   ├── environment.tf
│   ├── jobs.tf
│   ├── project.tf
│   ├── providers.tf
│   ├── repository.tf
│   ├── variables.tf
│   └── ...
├── snowflake_infra/               # Terraform for Snowflake architecture
│   ├── development/
│   ├── production/
│   └── modules/
│       ├── database/
│       ├── users/
│       └── warehouse/
├── solaz_dbt/                     # dbt project
│   ├── dbt_project.yml
│   ├── profiles.yml
│   ├── macros/
│   └── models/
│       ├── sources/
│       ├── silver/
│       └── gold/
└── ...
```

## dbt project

The dbt project is configured under `solaz_dbt` and currently includes:

### Silver layer models

Staging and cleanup models for source data normalization, including:

- `stg_postgres__dim_customers`
- `stg_postgres__dim_products`
- `stg_postgres__app_orders`
- `stg_gsheets__orders`
- `stg_s3__rfid_scans`

These models include type casting, timestamp normalization, deduplication, model and column documentation, and data quality tests.

### Gold layer models

The analytics layer provides the business-facing dataset used for analysis and reporting:

- `dim_customers`
- `dim_products`
- `fact_inventory_rfid_scans`
- `fact_omnichannel_sales`
- `mart_daily_sku_profitability`

The project is configured so that:

- Silver models are materialized as views
- Gold dimensions are materialized as tables
- Gold fact and mart models are configured for incremental processing

## Infrastructure

### Snowflake

The `snowflake_infra` directory contains Terraform for creating and managing Snowflake resources, including databases, schemas, warehouses, users, roles, grants, external tables, storage integrations, and Bronze source-backed tables.

Separate `development` and `production` environment configurations are provided, along with reusable modules for databases, users, and warehouses.

### dbt Cloud

The `dbt_cloud_infra` directory provisions dbt Cloud resources via Terraform, including project configuration, repository connections, environments, credentials, and jobs.

## Tech stack

- Snowflake
- dbt Core / dbt Cloud
- Terraform
- SQL
- Python
- SQLFluff

## Prerequisites

Before running the project locally, ensure the following are available:

- Python 3.10+
- pip
- Terraform
- Snowflake account access
- dbt Snowflake adapter support
- Cloud credentials for Snowflake, dbt, and ingestion sources

## Local setup

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
pip install -r requirements_dev.txt
```

## dbt workflow

From the project root:

```bash
cd solaz_dbt

dbt debug
dbt deps
dbt run
dbt test
dbt docs generate
dbt docs serve
```

## Terraform workflow

For the Snowflake development environment:

```bash
cd snowflake_infra/development
terraform init
terraform plan
terraform apply
```

For production:

```bash
cd snowflake_infra/production
terraform init
terraform plan
terraform apply
```

For dbt Cloud infrastructure:

```bash
cd dbt_cloud_infra
terraform init
terraform plan
terraform apply
```

## Data quality and standards

This repository includes SQL quality controls and validation patterns:

- SQLFluff formatting rules
- dbt tests for uniqueness, null checks, and accepted values
- Model and column documentation in YAML files
