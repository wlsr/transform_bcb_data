WITH ranked_data AS (
    -- Ordenar los datos por moneda y fecha
    SELECT
        currency,
        exchange_rate_me,
        date,
        LAG(exchange_rate_me) OVER (PARTITION BY currency ORDER BY date) AS prev_exchange_rate
    FROM raw_exchange_rates
    WHERE country is NULL
)

-- Calculate the exchange rate
SELECT
    currency as currency_pair,
    exchange_rate_me as exchange_rate,
    date,
    prev_exchange_rate,
    
    -- Calculate depreciation/apreciation rate in percentage
    CASE
        WHEN prev_exchange_rate IS NULL THEN NULL
        ELSE ((exchange_rate_me - prev_exchange_rate) / prev_exchange_rate) * 100
    END AS depreciation_rate
FROM ranked_data

