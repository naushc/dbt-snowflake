WITH raw_data AS (
    SELECT
        SYMBOL,
        TIMESTAMP,
        CAST(VOLUME AS NUMBER(19,0)) AS VOLUME
    FROM {{ source('raw', 'stock_prices_all') }}
),

derived_data AS (
    SELECT
        SYMBOL,
        VOLUME,
        EXTRACT(YEAR FROM TO_TIMESTAMP(TIMESTAMP / 1000)) AS YEAR,  -- Convert timestamp to year
        EXTRACT(WEEK FROM TO_TIMESTAMP(TIMESTAMP / 1000)) AS WEEK_NO  -- Convert timestamp to week number
    FROM raw_data
)

SELECT
    SYMBOL,
    YEAR,
    WEEK_NO,
    SUM(VOLUME) AS TOTAL_VOLUME
FROM derived_data
GROUP BY SYMBOL, YEAR, WEEK_NO
ORDER BY SYMBOL, YEAR, WEEK_NO
