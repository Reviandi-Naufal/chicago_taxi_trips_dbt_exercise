{{ config(
    materialized = 'ephemeral'
) }}

SELECT
    EXTRACT(
        YEAR
        FROM
            trip_start_timestamp
    ) AS trip_year,
    EXTRACT(
        MONTH
        FROM
            trip_start_timestamp
    ) AS trip_month,
    company,
    trip_miles,
    trip_total
FROM
    {{ source(
        'chicago_taxi_trips',
        'taxi_trips'
    ) }}
