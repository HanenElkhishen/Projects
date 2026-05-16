-- ============================================
-- Solid Waste Management Data Warehouse
-- Script 05: Materialized View (Task 16)
-- ============================================
-- Purpose: Store precomputed max waste stats
-- per city, station, and truck type
-- for faster query access
-- ============================================

-- Drop if exists
DROP MATERIALIZED VIEW IF EXISTS max_waste_stats;

-- Create Materialized View
CREATE MATERIALIZED VIEW max_waste_stats AS
SELECT
    s.City,
    f.StationID,
    t.TruckType,
    MAX(f.WasteCollected) AS MaxWasteCollected
FROM FactTrips f
JOIN DimStation s ON f.StationID = s.StationID
JOIN DimTruck   t ON f.TruckID   = t.TruckID
GROUP BY s.City, f.StationID, t.TruckType
ORDER BY s.City, f.StationID, t.TruckType;

-- Query the materialized view
SELECT * FROM max_waste_stats LIMIT 5;
