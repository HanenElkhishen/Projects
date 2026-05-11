# Toll Data ETL Pipeline with Apache Airflow

## Project Overview

This project involves building a production-ready ETL (Extract, Transform, Load) pipeline designed to automate the processing of vehicle toll data. The pipeline handles data coming from diverse file formats, centralizes it, and applies business logic transformations to prepare the dataset for downstream analytical tasks.

---

## Key Data Engineering Concepts

- **Workflow Orchestration:** Managing task dependencies and scheduling using Directed Acyclic Graphs (DAGs).
- **Data Extraction:** Handling multiple source formats including CSV, TSV, and Fixed-width.
- **Data Transformation:** Cleaning and standardizing raw data using Linux-based text processing utilities.
- **Automated Monitoring:** Implementing automated retries and failure notifications.

---

## Technologies & Tools

| Tool | Purpose |
|------|---------|
| **Apache Airflow** | Core engine for orchestrating the pipeline |
| **Python** | DAG logic and task configuration |
| **`tar`** | Data decompression |
| **`cut`** | Field-level extraction from delimited files |
| **`awk`** | Advanced text processing and fixed-width extraction |
| **`paste`** | Merging multiple data streams horizontally |
| **`tr`** | Character transformation (case normalization) |

---

## Data Pipeline Architecture

The pipeline follows a linear dependency chain where each task ensures data integrity before passing it to the next stage:

```
unzip_data → extract_data_from_csv → extract_data_from_tsv → extract_data_from_fixed_width → consolidate_data → transform_data
```

| Task Name | Description | Source Format |
|-----------|-------------|---------------|
| `unzip_data` | Decompresses the raw data package to access source files | `.tgz` |
| `extract_data_from_csv` | Extracts vehicle identity and timestamp information | `.csv` |
| `extract_data_from_tsv` | Pulls toll plaza IDs and axle counts | `.tsv` |
| `extract_data_from_fixed_width` | Parses specific payment and vehicle codes | Fixed-Width |
| `consolidate_data` | Merges all extracted streams into a single master file | Master `.csv` |
| `transform_data` | Standardizes vehicle types to uppercase for data consistency | Final `.csv` |

---

## DAG Specifications

- **Schedule:** Configured to run on a defined interval (e.g., Daily).
- **Error Handling:** Automated email alerts on task failure or retries.
- **Resiliency:** Built-in retry logic — 1 retry after a 5-minute cooldown — to handle transient failures.
