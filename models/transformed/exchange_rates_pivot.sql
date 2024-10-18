-- models/transformed/exchange_rates_pivot.sql
WITH pivoted_rates AS (
    SELECT
        date,
        MAX(CASE WHEN currency = 'USD_V' THEN exchange_rate_bs END) AS usd_v_rate,
        MAX(CASE WHEN currency = 'USD_C' THEN exchange_rate_bs END) AS usd_c_rate,
        MAX(CASE WHEN currency = 'EUR' THEN exchange_rate_bs END) AS eur_rate,
        MAX(CASE WHEN currency = 'JPY' THEN exchange_rate_bs END) AS jpy_rate,
        MAX(CASE WHEN currency = 'GBP' THEN exchange_rate_bs END) AS gbp_rate,
        MAX(CASE WHEN currency = 'AUD' THEN exchange_rate_bs END) AS aud_rate,
        MAX(CASE WHEN currency = 'CAD' THEN exchange_rate_bs END) AS cad_rate
        -- Agrega más monedas si es necesario
    FROM
        {{ ref('normalized_exchange_rates') }}
    GROUP BY
        date
    ORDER by 
        date
)
SELECT * FROM pivoted_rates