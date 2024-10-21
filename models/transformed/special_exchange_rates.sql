--special_exchange_rates.sql
WITH special_currency AS (
    SELECT
        monetary_unit AS unit_name,
        currency AS currency_pair,
        exchange_rate_me AS exchange_rate,
        date
    FROM public.raw_exchange_rates
    WHERE country IS NULL
)

SELECT * FROM special_currency