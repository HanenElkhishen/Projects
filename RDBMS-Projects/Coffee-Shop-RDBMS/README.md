# ☕ Coffee Shop Chain — RDBMS Project

> **Role:** Data Engineer | **Tools:** PostgreSQL · MySQL · pgAdmin 4 | **Year:** 2025

## 📋 Overview
A New York-based coffee shop chain is expanding nationally. As the Data Engineer, I consolidated data from multiple legacy systems (POS, CRM, spreadsheets, supplier databases) into a single normalized relational database using PostgreSQL, then exported subsets into MySQL for downstream consumption.

## 🗂️ Data Sources
| Source | Data | Format |
|---|---|---|
| HQ Spreadsheet | Staff & Outlet Info | Excel / CSV |
| POS System | Sales Transactions | CSV |
| CRM System | Customer Profiles | CSV |
| Supplier Database | Product Catalog | Spreadsheet |

## 🗄️ Schema — 7 Tables (3NF)
| Table | Description |
|---|---|
| `customer` | Customer profiles and loyalty card data |
| `product` | Product catalog with pricing |
| `product_type` | Lookup table for product categories |
| `sales_outlet` | Franchise/outlet locations |
| `staff` | Employee records |
| `sales_transaction` | Transaction header (date, time, outlet, staff, customer) |
| `sales_detail` | Transaction line items (product, quantity, price) |

## 🔗 Relationships
| From | To | Type |
|---|---|---|
| `sales_transaction` | `sales_outlet` | Many-to-One |
| `sales_transaction` | `staff` | Many-to-One |
| `sales_transaction` | `customer` | Many-to-One |
| `sales_detail` | `sales_transaction` | Many-to-One |
| `sales_detail` | `product` | Many-to-One |
| `product` | `product_type` | Many-to-One |
| `sales_outlet` | `staff` (manager) | Many-to-One |

## 🔧 Technologies
| Technology | Role |
|---|---|
| PostgreSQL 18 | Primary RDBMS |
| pgAdmin 4 | ERD design + SQL generation |
| MySQL 8 | Staging database |
| MySQL Workbench | MySQL management |
| dbdiagram.io | ERD prototyping |

## ✨ Key Highlights
- ERD designed in pgAdmin 4 with **auto-generated DDL** — no manual CREATE TABLE scripting
- Schema normalized to **3NF** across all 7 tables
- **Materialized view** `product_info_m-view` pre-computes 88 product records for fast reporting
- **Cross-platform pipeline**: data exported from PostgreSQL and loaded into MySQL

## 🚀 How to Run
```bash
createdb COFFEE
psql -d COFFEE -f sql/coffee_schema.sql
psql -d COFFEE -f sql/views.sql
psql -d COFFEE -f sql/materialized_views.sql
psql -d COFFEE -c 'REFRESH MATERIALIZED VIEW public."product_info_m-view";'
```
## 📄 License
Educational project. Data used is modified sample data for learning purposes only.

---
*Built with PostgreSQL 18 · pgAdmin 4 · MySQL 8 · dbdiagram.io*
