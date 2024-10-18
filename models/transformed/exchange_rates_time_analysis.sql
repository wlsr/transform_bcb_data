-- models/transformed/exchange_rates_time_analysis.sql
WITH temporal_analysis AS (
    SELECT
        country,
        currency,
        date_trunc('week', date) AS week,  -- O 'day', 'week', 'year' según lo que quieras analizar
        AVG(exchange_rate_bs) AS avg_exchange_rate_bs,
        AVG(exchange_rate_me) AS avg_exchange_rate_me
    FROM
        {{ ref('normalized_exchange_rates') }}
    GROUP BY
        week, country, currency
    ORDER BY 
        week
)
SELECT * 
FROM temporal_analysis