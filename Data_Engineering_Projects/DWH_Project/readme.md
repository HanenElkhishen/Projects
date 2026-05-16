# 🗄️ Solid Waste Management Data Warehouse

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![pgAdmin](https://img.shields.io/badge/pgAdmin-4-blue?style=for-the-badge)
![SQL](https://img.shields.io/badge/SQL-Advanced-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

---

## 📋 Project Overview

This project simulates a **real-world data warehousing scenario** where I acted as a Data Engineer for a solid waste management company operating across major cities in **Brazil**. The company collects and recycles solid waste using hundreds of trucks of different types, and needed a data warehouse to support business intelligence and reporting.

The project covers the full data warehouse lifecycle:
- Analytical requirements gathering
- Star schema design
- Data loading from CSV files
- Writing advanced SQL aggregation queries
- Creating materialized views for query optimization

---

## 🏢 Business Context

The company needed to generate the following reports:

| Report | Description |
|---|---|
| 📅 Total waste per year per city | Annual waste collection by city |
| 🗓️ Total waste per month per city | Monthly waste collection by city |
| 📆 Total waste per quarter per city | Quarterly waste collection by city |
| 🚛 Total waste per year per truck type | Annual breakdown by truck type |
| 🏙️ Total waste per truck type per city | Truck performance across cities |
| 🏭 Total waste per truck type per station per city | Station-level granularity |

---

## 🗂️ Project Structure

```
solid-waste-dw/
│
├── data/
│   ├── DimDate.csv
│   ├── DimTruck.csv
│   ├── DimStation.csv
│   └── FactTrips.csv
│
├── sql/
│   ├── 01_create_tables.sql
│   ├── 02_grouping_sets.sql
│   ├── 03_rollup.sql
│   ├── 04_cube.sql
│   └── 05_materialized_view.sql
│
├── screenshots/
│   ├── 9-DimDate.jpg
│   ├── 10-DimTruck.jpg
│   ├── 11-DimStation.jpg
│   ├── 12-FactTrips.jpg
│   ├── 13-groupingsets.jpg
│   ├── 14-rollup.jpg
│   ├── 15-cube.jpg
│   └── 16-mv.jpg
│
└── README.md
```

---

## 🌟 Star Schema Design

The data warehouse is built using a **Star Schema** consisting of:

```
                    ┌─────────────┐
                    │   DimDate   │
                    │─────────────│
                    │ Dateid (PK) │
                    │ Date        │
                    │ Year        │
                    │ Quarter     │
                    │ Month       │
                    │ Day         │
                    │ Weekday     │
                    └──────┬──────┘
                           │
   ┌─────────────┐   ┌─────┴──────────┐   ┌──────────────┐
   │  DimTruck   │   │   FactTrips    │   │  DimStation  │
   │─────────────│   │────────────────│   │──────────────│
   │TruckID (PK) ├───│ TripID (PK)    ├───│StationID (PK)│
   │ TruckType   │   │ Dateid (FK)    │   │ City         │
   └─────────────┘   │ StationID (FK) │   └──────────────┘
                     │ TruckID (FK)   │
                     │ WasteCollected │
                     └────────────────┘
```

### Tables

**Dimension Tables:**
- `DimDate` — Date attributes (Year, Quarter, Month, Day, Weekday)
- `DimTruck` — Truck types used for waste collection
- `DimStation` — Collection stations with city information

**Fact Table:**
- `FactTrips` — Each record represents one waste collection trip with the amount of waste collected (in tons)

---

## 🛠️ Technologies Used

- **Database:** PostgreSQL
- **GUI Tool:** pgAdmin 4
- **Query Language:** SQL (Advanced — Grouping Sets, Rollup, Cube, Materialized Views)
- **Data Format:** CSV

---

## 🚀 Setup & Installation

### Prerequisites
- PostgreSQL installed
- pgAdmin 4 installed

### Steps

**1. Create the Database**
```sql
CREATE DATABASE FinalProject;
```

**2. Create the Tables**
```sql
-- Dimension Table: DimDate
CREATE TABLE DimDate (
    Dateid        INT PRIMARY KEY,
    date          DATE,
    Year          SMALLINT,
    Quarter       SMALLINT,
    QuarterName   VARCHAR(10),
    Month         SMALLINT,
    MonthName     VARCHAR(10),
    Day           SMALLINT,
    Weekday       SMALLINT,
    WeekdayName   VARCHAR(10)
);

-- Dimension Table: DimTruck
CREATE TABLE DimTruck (
    TruckID      INT PRIMARY KEY,
    TruckType    VARCHAR(50)
);

-- Dimension Table: DimStation
CREATE TABLE DimStation (
    StationID   INT PRIMARY KEY,
    City        VARCHAR(50)
);

-- Fact Table: FactTrips
CREATE TABLE FactTrips (
    TripID         INT PRIMARY KEY,
    Dateid         INT REFERENCES DimDate(Dateid),
    StationID      INT REFERENCES DimStation(StationID),
    TruckID        INT REFERENCES DimTruck(TruckID),
    WasteCollected DECIMAL(6,2)
);
```

**3. Load Data**

Use pgAdmin's **Import/Export** feature to load each CSV file into its corresponding table:

| CSV File | Target Table |
|---|---|
| DimDate.csv | DimDate |
| DimTruck.csv | DimTruck |
| DimStation.csv | DimStation |
| FactTrips.csv | FactTrips |

---

## 📊 SQL Queries

### Grouping Sets
Summarizes total waste collected across multiple grouping combinations of `StationID` and `TruckType`:

```sql
SELECT
    s.StationID,
    t.TruckType,
    SUM(f.WasteCollected) AS TotalWasteCollected
FROM FactTrips f
JOIN DimStation s ON f.StationID = s.StationID
JOIN DimTruck t ON f.TruckID = t.TruckID
GROUP BY GROUPING SETS (
    (s.StationID, t.TruckType),
    (s.StationID),
    (t.TruckType),
    ()
)
ORDER BY s.StationID, t.TruckType;
```

### Rollup
Hierarchical aggregation of total waste by `Year → City → StationID`:

```sql
SELECT
    d.Year,
    s.City,
    f.StationID,
    SUM(f.WasteCollected) AS TotalWasteCollected
FROM FactTrips f
JOIN DimDate d ON f.Dateid = d.Dateid
JOIN DimStation s ON f.StationID = s.StationID
GROUP BY ROLLUP (d.Year, s.City, f.StationID)
ORDER BY d.Year, s.City, f.StationID;
```

### Cube
All possible combinations of average waste by `Year`, `City`, and `StationID`:

```sql
SELECT
    d.Year,
    s.City,
    f.StationID,
    AVG(f.WasteCollected) AS AvgWasteCollected
FROM FactTrips f
JOIN DimDate d ON f.Dateid = d.Dateid
JOIN DimStation s ON f.StationID = s.StationID
GROUP BY CUBE (d.Year, s.City, f.StationID)
ORDER BY d.Year, s.City, f.StationID;
```

### Materialized View
Stores precomputed max waste stats per city, station, and truck type for faster query access:

```sql
CREATE MATERIALIZED VIEW max_waste_stats AS
SELECT
    s.City,
    f.StationID,
    t.TruckType,
    MAX(f.WasteCollected) AS MaxWasteCollected
FROM FactTrips f
JOIN DimStation s ON f.StationID = s.StationID
JOIN DimTruck t ON f.TruckID = t.TruckID
GROUP BY s.City, f.StationID, t.TruckType
ORDER BY s.City, f.StationID, t.TruckType;
```

---

## 📸 Screenshots

| Task | Screenshot |
|---|---|
| Load DimDate | `screenshots/9-DimDate.jpg` |
| Load DimTruck | `screenshots/10-DimTruck.jpg` |
| Load DimStation | `screenshots/11-DimStation.jpg` |
| Load FactTrips | `screenshots/12-FactTrips.jpg` |
| Grouping Sets Query | `screenshots/13-groupingsets.jpg` |
| Rollup Query | `screenshots/14-rollup.jpg` |
| Cube Query | `screenshots/15-cube.jpg` |
| Materialized View | `screenshots/16-mv.jpg` |

---

## 💡 Key Concepts Demonstrated

- **Star Schema Design** — Separating facts from dimensions for efficient querying
- **Granularity** — Each fact record represents one collection trip (finest grain)
- **Grouping Sets** — Multiple aggregation levels in a single query
- **Rollup** — Hierarchical subtotals from detailed to grand total
- **Cube** — All possible aggregation combinations for multidimensional analysis
- **Materialized Views** — Precomputed results stored on disk for performance optimization
- **Foreign Keys** — Referential integrity between fact and dimension tables
- **Primary Keys** — Unique identification of every record in dimension tables

---

## 📚 What I Learned

- Designing and implementing a **Star Schema** from scratch
- Writing advanced SQL with **GROUPING SETS**, **ROLLUP**, and **CUBE**
- Understanding **data granularity** and its impact on warehouse design
- Using **Materialized Views** for query optimization
- Loading real-world data from CSV files using pgAdmin
- Distinguishing between **analytical**, **diagnostic**, and **ad-hoc** requirements

---

## 🏆 Course

This project is part of the **IBM Data Engineering Professional Certificate** on Coursera — Data Warehousing Fundamentals module.

---

## 👤 Author

**Hanen El-Khishen**
- LinkedIn: (www.linkedin.com/in/hanenhosamelkhishen)

---

*⭐ If you found this project helpful, please consider giving it a star!*
