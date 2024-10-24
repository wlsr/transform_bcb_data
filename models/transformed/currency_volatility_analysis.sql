WITH volatility_analysis AS (
    SELECT
        DATE_TRUNC('month', date) AS month, 
        EXTRACT(YEAR FROM date) AS year, 
        country,
        currency,
        STDDEV(exchange_rate_bs) AS stddev_bs,
        STDDEV(exchange_rate_me) AS stddev_me,
        AVG(exchange_rate_bs) AS avg_exchange_rate_bs, 
        AVG(exchange_rate_me) AS avg_exchange_rate_me 
    FROM
        {{ ref('normalized_exchange_rates') }}
    GROUP BY
        month, year, country, currency
)

SELECT * 
FROM volatility_analysis
