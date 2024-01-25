WITH RECURSIVE flight_by_time AS (
    -- base case
    SELECT
        flights.start_port AS fsp,
        flights.end_port AS fep,
        flights.start_time AS fst,
        flights.end_time AS fet,
        0 AS plane_jumps,
        '' || flights.start_port || '->' || flights.end_port AS route,
        EXTRACT(epoch FROM (flights.end_time - flights.start_time)) / 60 AS total_time
    FROM flights
        INNER JOIN airports
        ON flights.start_port = airports.post_code
    AND city_name = 'New York'

    UNION ALL

    -- recursive call
    SELECT
        f1.start_port AS fsp,
        f1.end_port AS fep,
        f1.start_time AS fst,
        f1.end_time AS fet,
        plane_jumps+1 AS plane_jumps,
        fbt.route || '->' || f1.end_port AS route,
        total_time + EXTRACT(epoch FROM (f1.start_time - fbt.fet)) / 60 + EXTRACT(epoch FROM (f1.end_time - f1.start_time)) / 60 AS total_time
    FROM flight_by_time fbt
    INNER JOIN flights f1
        ON fbt.fep = f1.start_port
        AND f1.start_time >= fbt.fet
    WHERE
        plane_jumps < 1
)
SELECT
    route, total_time
FROM
    flight_by_time
INNER JOIN airports
    ON flight_by_time.fep = airports.post_code
    AND airports.city_name = 'Tokyo'
ORDER BY total_time, plane_jumps
LIMIT 1;