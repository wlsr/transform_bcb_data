WITH volatility_analysis AS (
    SELECT
        DATE_TRUNC('month', date) AS month, -- Agrupa por mes
        EXTRACT(YEAR FROM date) AS year, -- Extrae el año
        country,
        currency,
        STDDEV(exchange_rate_bs) AS stddev_bs,
        STDDEV(exchange_rate_me) AS stddev_me
    FROM
        {{ ref('normalized_exchange_rates') }}
    GROUP BY
        month, year, country, currency
)

SELECT * 
FROM volatility_analysis
