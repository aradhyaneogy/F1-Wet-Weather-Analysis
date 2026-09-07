
-- F1 Wet Weather Analysis
-- SQL Analysis Queries


-- Query 1: Top 10 position gains

SELECT
    Year,
    Race,
    Driver,
    Team,
    Grid_Position,
    Finish_Position,
    Position_Change
FROM race_strategy
ORDER BY Position_Change DESC
LIMIT 10;


-- Query 2: Races ranked by rainfall

SELECT
    Year,
    Race,
    Total_Rain,
    Max_Hourly_Rain,
    Rain_Hours
FROM races
ORDER BY Total_Rain DESC;


-- Query 3: Rainfall and driver strategy

SELECT
    rs.Year,
    rs.Race,
    rs.Driver,
    rs.Team,
    r.Total_Rain,
    r.Rain_Hours,
    rs.Intermediate_Share,
    rs.Tyre_Changes,
    rs.Position_Change
FROM race_strategy rs
JOIN races r
    ON rs.Year = r.Year
    AND rs.Race = r.Race
ORDER BY rs.Position_Change DESC;


-- Query 4: Race-level strategy and performance

SELECT
    r.Year,
    r.Race,
    r.Total_Rain,
    r.Rain_Hours,
    ROUND(AVG(rs.Intermediate_Share), 3) AS Avg_Intermediate_Share,
    ROUND(AVG(rs.Tyre_Changes), 2) AS Avg_Tyre_Changes,
    ROUND(AVG(rs.Position_Change), 2) AS Avg_Position_Change,
    MAX(rs.Position_Change) AS Max_Position_Gain
FROM races r
JOIN race_strategy rs
    ON r.Year = rs.Year
    AND r.Race = rs.Race
GROUP BY
    r.Year,
    r.Race
ORDER BY r.Total_Rain DESC;


-- Query 5: Position gains in heavy rain

SELECT
    rs.Year,
    rs.Race,
    rs.Driver,
    rs.Team,
    r.Total_Rain,
    r.Rain_Hours,
    rs.Position_Change,
    ROUND(rs.Intermediate_Share, 3) AS Intermediate_Share
FROM race_strategy rs
JOIN races r
    ON rs.Year = r.Year
    AND rs.Race = r.Race
WHERE r.Total_Rain > 5
  AND rs.Position_Change > 0
ORDER BY rs.Position_Change DESC;


-- Query 6: Driver performance across multiple wet races

SELECT
    Driver,
    COUNT(*) AS Races,
    ROUND(AVG(Intermediate_Share), 3) AS Avg_Intermediate_Share,
    ROUND(AVG(Tyre_Changes), 2) AS Avg_Tyre_Changes,
    ROUND(AVG(Position_Change), 2) AS Avg_Position_Change,
    MAX(Position_Change) AS Best_Position_Gain
FROM race_strategy
GROUP BY Driver
HAVING COUNT(*) >= 2
ORDER BY Avg_Position_Change DESC;


-- Query 7: Drivers gaining positions with significant intermediate usage

WITH driver_strategy AS (
    SELECT
        Driver,
        Race,
        Position_Change,
        Intermediate_Share
    FROM race_strategy
)
SELECT
    Driver,
    Race,
    ROUND(Intermediate_Share, 3) AS Intermediate_Share,
    Position_Change
FROM driver_strategy
WHERE Intermediate_Share >= 0.30
  AND Position_Change > 0
ORDER BY Position_Change DESC;
