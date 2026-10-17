DROP TABLE IF EXISTS user_path_result;
CREATE TABLE user_path_result AS
WITH item AS (
    SELECT 
        user_id, 
        behavior_type, 
        ts,
        LAG(behavior_type) OVER (
            PARTITION BY user_id 
            ORDER BY ts
        ) AS pre_behavior 
    FROM user_behavior_clean
)
SELECT 
    pre_behavior, 
    behavior_type, 
    COUNT(DISTINCT user_id) AS user_count
FROM item
WHERE pre_behavior IS NOT NULL
GROUP BY pre_behavior, behavior_type
ORDER BY user_count DESC;