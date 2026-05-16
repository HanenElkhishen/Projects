-- ============================================
-- Solid Waste Management Data Warehouse
-- Script 02: Grouping Sets Query (Task 13)
-- ============================================
-- Purpose: Summarize total waste collected
-- across multiple grouping combinations
-- of StationID and TruckType
-- ============================================

SELECT
    s.StationID,
    t.TruckType,
    SUM(f.WasteCollected) AS TotalWasteCollected
FROM FactTrips f
JOIN DimStation s ON f.StationID = s.StationID
JOIN DimTruck   t ON f.TruckID   = t.TruckID
GROUP BY GROUPING SETS (
    (s.StationID, t.TruckType),  -- Group by both
    (s.StationID),               -- Group by station only
    (t.TruckType),               -- Group by truck type only
    ()                           -- Grand total
)
ORDER BY s.StationID, t.TruckType;
