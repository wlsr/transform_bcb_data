--normalized_exchange_ratessql
WITH change_currency AS (
    SELECT
        country,
        monetary_unit,
        CASE
            WHEN currency = 'USD.VENTA' THEN 'USD_V'
            WHEN currency = 'USD.COMPRA' THEN 'USD_C'
            ELSE currency
        END AS currency,
        exchange_rate_bs,
        exchange_rate_me,
        date
    FROM public.raw_exchange_rates
    WHERE country IS NOT NULL
)

SELECT * FROM change_currency