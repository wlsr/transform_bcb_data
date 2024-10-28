WITH volatility_analysis AS (
    SELECT
        DATE_TRUNC('month', date) AS month,  -- Rounds the date to the first day of the month.
        EXTRACT(YEAR FROM date) AS year, -- Extract the year part from the date.
        country,
        currency,
        STDDEV(exchange_rate_bs) AS stddev_bs,
        STDDEV(exchange_rate_me) AS stddev_me,
        AVG(exchange_rate_bs) AS avg_exchange_rate_bs, 
        AVG(exchange_rate_me) AS avg_exchange_rate_me 
    FROM
        {{ ref('normalized_exchange_rates') }}
    WHERE 
        exchange_rate_me IS NOT NULL 
    GROUP BY
        month, year, country, currency  
)

SELECT * 
FROM volatility_analysis
