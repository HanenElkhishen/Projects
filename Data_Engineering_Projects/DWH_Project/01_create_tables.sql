-- ============================================
-- Solid Waste Management Data Warehouse
-- Script 01: Create Tables (Star Schema)
-- Database: FinalProject
-- ============================================

-- Drop tables if they exist (in correct order to respect FK constraints)
DROP TABLE IF EXISTS FactTrips;
DROP TABLE IF EXISTS DimDate;
DROP TABLE IF EXISTS DimTruck;
DROP TABLE IF EXISTS DimStation;

-- ----------------------
-- Dimension Table: DimDate
-- ----------------------
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

-- ----------------------
-- Dimension Table: DimTruck
-- ----------------------
CREATE TABLE DimTruck (
    TruckID      INT PRIMARY KEY,
    TruckType    VARCHAR(50)
);

-- ----------------------
-- Dimension Table: DimStation
-- ----------------------
CREATE TABLE DimStation (
    StationID   INT PRIMARY KEY,
    City        VARCHAR(50)
);

-- ----------------------
-- Fact Table: FactTrips
-- ----------------------
CREATE TABLE FactTrips (
    TripID         INT PRIMARY KEY,
    Dateid         INT REFERENCES DimDate(Dateid),
    StationID      INT REFERENCES DimStation(StationID),
    TruckID        INT REFERENCES DimTruck(TruckID),
    WasteCollected DECIMAL(6,2)
);
