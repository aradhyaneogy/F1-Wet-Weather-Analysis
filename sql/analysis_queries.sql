-- F1 Wet Weather Strategy & Performance Analysis
-- SQL Analysis Queries


-- 1. Top 10 Driver Position Gains

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


-- 2. Race Rainfall Severity

SELECT
    Year,
    Race,
    Total_Rain,
    Max_Hourly_Rain,
    Rain_Hours
FROM races
ORDER BY Total_Rain DESC;


-- 3. Weather + Driver Strategy Analysis

SELECT
    rs.Driver,
    rs.Race,
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


-- 4. Race-Level Performance

SELECT
    r.Year,
    r.Race,
    r.Total_Rain,
    r.Rain_Hours,
    ROUND(AVG(rs.Intermediate_Share), 3) AS Avg_Intermediate_Share,
    ROUND(AVG(rs.Position_Change), 2) AS Avg_Position_Change,
    MAX(rs.Position_Change) AS Max_Position_Gain
FROM races r
JOIN race_strategy rs
    ON r.Year = rs.Year
    AND r.Race = rs.Race
GROUP BY r.Year, r.Race
ORDER BY r.Total_Rain DESC;
