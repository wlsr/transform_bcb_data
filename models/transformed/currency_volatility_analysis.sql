WITH volatility_analysis AS (
    SELECT
        country,
        currency,
        STDDEV(exchange_rate_bs) AS stddev_bs,
        STDDEV(exchange_rate_me) AS stddev_me
    FROM
        {{ ref('normalized_exchange_rates') }}
    GROUP BY
        country, currency
)

SELECT * 
FROM volatility_analysis