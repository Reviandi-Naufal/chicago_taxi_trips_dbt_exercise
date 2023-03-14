{{ config(
    materialized = 'table'
) }}

SELECT
    trip_year,
    trip_month,
    company,
    SUM(trip_total) AS num_of_trips
FROM
    {{ ref('trips_date_clean') }}
WHERE
    trip_year IS NOT NULL
    AND trip_month IS NOT NULL
    AND company IS NOT NULL
    AND trip_total IS NOT NULL
GROUP BY
    trip_year,
    trip_month,
    company
ORDER BY
    trip_year,
    trip_month,
    company
