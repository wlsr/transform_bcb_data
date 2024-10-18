-- tests/not_duplicated_combination.sql

WITH duplicates AS (
    SELECT
        country,
        monetary_unit,
        date,
        COUNT(*) AS count
    FROM {{ ref('normalized_exchange_rates') }}
    GROUP BY country, monetary_unit, date
    HAVING COUNT(*) > 1
)

SELECT * FROM duplicates
