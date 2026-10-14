DROP TABLE IF EXISTS user_behavior_sample;
CREATE TABLE user_behavior_sample AS
SELECT * FROM user_behavior LIMIT 1000000;