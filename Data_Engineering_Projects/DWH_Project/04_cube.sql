-- ============================================
-- Solid Waste Management Data Warehouse
-- Script 04: Cube Query (Task 15)
-- ============================================
-- Purpose: Calculate all possible combinations
-- of average waste collected across
-- Year, City, and StationID dimensions
-- ============================================

SELECT
    d.Year,
    s.City,
    f.StationID,
    AVG(f.WasteCollected) AS AvgWasteCollected
FROM FactTrips f
JOIN DimDate    d ON f.Dateid    = d.Dateid
JOIN DimStation s ON f.StationID = s.StationID
GROUP BY CUBE (d.Year, s.City, f.StationID)
ORDER BY d.Year, s.City, f.StationID;
