
# DBT Project: Exchange rate Analysis

## Project Description

This DBT project aims to analyze of exchange rates for various currencies over time. The data source is the Central Bank of Bolivia, including both currencies and metals. The analysis focuses on identifying stable and volatile currencies, as well as studying trends related to depreciation and appreciation in different regions.

## Project Architecture

The project is divided into two main phases:

1. **Extraction and Loading (EL)**:
   - Data is obtained through web scraping from the Central Bank of Bolivia's website.
   - The data is stored in a local data warehouse using PostgreSQL. (in the repository [https://github.com/wlsr/bcb-data-scraper])

2. **Transformation (T)**:
   - DBT is used for data transformation and modeling.
   - The main model is `currency_volatility_analysis`, which calculates the monthly standard deviation of exchange rates to evaluate volatility.

## Models in the Project

### `normalized_exchange_rates`
This model transforms and normalizes the exchange rates of currencies and metals, converting them into a standardized structure for analysis. The fields include:

### `volatility_analysis`
This model calculates the standard deviation of exchange rates per month to identify volatility in two exchange rates: in bolivianos (`stddev_bs`) and in foreign currency (`stddev_me`). It is used to understand how currency stability varies over time.

## Analyses Included

- **Identifying Volatile and Stable Currencies**: An analysis is performed to find which currencies exhibit high volatility and which are more stable.
- **Relationship between Depreciation and Appreciation of UFV and USD/SDR**: The relationship between inflation and UFV appreciation against the USD/SDR is analyzed.
- **Trend Analysis by Continent**: Using Power BI, visualizations are created to observe currency volatility in different regions.

## Project Setup

1. Clone the repository:
   ```bash
   git clone <https://github.com/wlsr/bcb-data-scraper.git>
   ```

2. Configure the connections:
   - Make sure your DBT `profiles.yml` file is properly set up to connect to your PostgreSQL database.

3. Run the project:
   ```bash
   dbt run
   ```

4. Run the tests:
   ```bash
   dbt test
   ```

5. Generate the documentation:
   ```bash
   dbt docs generate
   ```

## Data Visualization

The transformed data in DBT is exposed in Power BI for visual analysis. The types of charts used include:


## Next Steps

- Integrate more data sources to expand the analysis.
- Add additional models for specific analyses, such as correlation between volatility and external economic factors.
- Optimize existing models to improve performance.


