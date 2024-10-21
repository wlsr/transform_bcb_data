-- models/transformed/exchange_rates_time_analysis.sql
WITH temporal_analysis AS (
    SELECT
        country,
        monetary_unit,
        currency,
        exchange_rate_bs,
        exchange_rate_me,
        date
    FROM
        {{ ref('normalized_exchange_rates') }}
    WHERE currency != 'USD_C'
)
SELECT * 
FROM temporal_analysis