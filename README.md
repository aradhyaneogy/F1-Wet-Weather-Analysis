# F1 Wet Weather Strategy & Performance Analysis

## Overview

An end-to-end Formula 1 data analytics project investigating the relationship between wet-weather conditions, tyre strategy and driver performance.

The project analyses five wet-weather Grands Prix using Python, SQL and Power BI.

## Objectives
- Analyse rainfall severity and duration across selected F1 races
- Investigate how wet conditions influence tyre strategy
- Analyse driver position changes during wet-weather races
- Identify drivers who gained the most positions
- Build an interactive Power BI dashboard
- Demonstrate an end-to-end data analytics workflow

## Technology Stack
- Python
    - Pandas
    - NumPy
    - Matplotlib
- SQL
    - SQLite
- Power BI
- GitHub

## Data

The analysis covers five wet-weather races:
- 2019 German Grand Prix
- 2021 Emilia-Romagna Grand Prix
- 2023 Dutch Grand Prix
- 2023 Monaco Grand Prix
- 2024 British Grand Prix

The dataset combines race-level rainfall information with driver-level tyre strategy and race-performance data.

## Methodology

### Python

Python was used to:
- Clean and prepare the race and weather data
- Calculate rainfall metrics
- Analyse tyre-stint information
- Calculate driver position changes
- Calculate intermediate and wet tyre usage
- Identify relationships between rainfall and race strategy
- Produce exploratory visualisations
  
### SQL

SQLite was used to create a structured analytical database containing:
- Race-level weather data
- Driver-level strategy and performance data
- SQL queries were then used to:
- Rank drivers by position gain
- Rank races by rainfall
- Join weather and driver strategy data
- Compare race-level strategy and performance
- Analyse drivers across multiple wet races

### Power BI

An interactive dashboard was created to visualise:
- Rainfall severity
- Rain duration
- Intermediate tyre usage
- Driver position changes
- Position gains
- Driver strategy and race performance

## Key Findings

The analysis identified several notable patterns.

1. Higher rainfall was generally associated with greater use of intermediate tyres.
2. Rainfall severity and duration also showed positive associations with intermediate tyre usage.
3. The 2019 German Grand Prix produced the largest position gain in the dataset. Sebastian Vettel gained 18 positions, moving from P20 on the grid to P2 at the finish.

Other notable position gains included:
- Daniil Kvyat: +11
- Lance Stroll: +11
- Pierre Gasly: +9
- Lando Norris: +4

4. The results also suggest that strategic decisions become increasingly important as weather conditions become more variable.

## Dashboard

The Power BI dashboard includes:
- Wet races analysed
- Average position change
- Largest position gain
- Average intermediate tyre usage
- Rainfall vs intermediate tyre usage
- Rain duration vs position change
- Position gains by race
- Driver strategy and race performance (Year, race and driver filters)

## Project Structure

```text
f1-wet-weather-analysis/
│
├── README.md
├── python/
│   └── F1_Wet_Weather_Analysis.ipynb
├── sql/
│   └── analysis_queries.sql
├── powerbi/
│   └── F1_Wet_Weather_Strategy_&_Performance_Analysis.pbix
├── data/
│   ├── races_powerbi.csv
│   └── strategy_powerbi.csv
└── output/
    ├── Largest_Position_Gains_in_Wet_Races.png
    ├── Rain_Duration_vs_Average_Position_Changes.png
    ├── Rainfall_Severity_vs_Intermediate_Tyre_Usage.png
    └── Top_10_Position_Gains_in_Wet_Races.png
```
## Limitations

- The analysis covers only five wet-weather races, so the findings should be interpreted as exploratory associations rather than causal relationships.
- Rainfall variables are measured at race level, while strategy and performance variables are measured at driver level. Therefore, correlations should not be interpreted as statistically independent driver-level observations.
- A larger dataset covering more seasons and races would provide a stronger basis for statistical analysis.

## Future Improvements

Potential extensions include:
- Expanding the dataset to all wet-weather races from 2018 onwards
- Incorporating lap-by-lap weather data
- Adding safety-car and red-flag information
- Analysing pit-stop timing
- Comparing team strategy decisions
- Adding driver skill and qualifying performance variables
- Building predictive models for tyre strategy
- Developing a more advanced Power BI dashboard

## Author

Business Management student with an interest in data analytics, technology, motorsport and data-driven decision-making.
