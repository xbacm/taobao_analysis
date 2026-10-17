WITH user_cohort AS (
    SELECT 
        user_id,
        date(MIN(event_time)) AS cohort_date
    FROM user_behavior_clean
    GROUP BY user_id
)
SELECT 
    b.user_id,
    a.cohort_date,
    coalesce(DATEDIFF(DATE(b.event_time), a.cohort_date),0) AS period_day
FROM user_cohort a
JOIN user_behavior_clean b ON a.user_id = b.user_id
;

