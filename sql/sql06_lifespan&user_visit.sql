WITH user_lifespan AS (
    SELECT
        user_id,
        DATE(MIN(event_time)) AS first_active_date,
        DATE(MAX(event_time)) AS last_active_date,
        DATEDIFF(DATE(MAX(event_time)), DATE(MIN(event_time))) AS lifespan_days
    FROM user_behavior_clean
    GROUP BY user_id
)
SELECT
    lifespan_days,
    COUNT(DISTINCT user_id) AS user_count
FROM user_lifespan
GROUP BY lifespan_days
ORDER BY lifespan_days;

WITH user_visit_days AS (
    SELECT DISTINCT user_id, DATE(event_time) AS visit_date
    FROM user_behavior_clean
),
user_lag AS (
    SELECT
        user_id,
        visit_date,
        LAG(visit_date) OVER (PARTITION BY user_id ORDER BY visit_date) AS prev_visit_date
    FROM user_visit_days
)
SELECT
    DATEDIFF(visit_date, prev_visit_date) AS return_gap_days,
    COUNT(DISTINCT user_id) AS user_count
FROM user_lag
WHERE prev_visit_date IS NOT NULL
GROUP BY return_gap_days
ORDER BY return_gap_days;