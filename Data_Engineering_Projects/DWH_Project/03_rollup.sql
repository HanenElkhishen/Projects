-- ============================================
-- Solid Waste Management Data Warehouse
-- Script 03: Rollup Query (Task 14)
-- ============================================
-- Purpose: Hierarchical aggregation of total
-- waste collected from detailed level up to
-- grand total: Year → City → StationID
-- ============================================

SELECT
    d.Year,
    s.City,
    f.StationID,
    SUM(f.WasteCollected) AS TotalWasteCollected
FROM FactTrips f
JOIN DimDate    d ON f.Dateid    = d.Dateid
JOIN DimStation s ON f.StationID = s.StationID
GROUP BY ROLLUP (d.Year, s.City, f.StationID)
ORDER BY d.Year, s.City, f.StationID;
