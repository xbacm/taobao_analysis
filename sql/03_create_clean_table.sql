-- 项目：淘宝用户行为分析
-- 功能：创建清洗后的用户行为表
-- 数据范围：2017-11-25 至 2017-12-03
-- 说明：
-- 1. 转换 Unix 时间戳
-- 2. 增加日期、小时、星期字段
-- 3. 删除异常时间记录

DROP TABLE IF EXISTS user_behavior_clean;
CREATE TABLE user_behavior_clean AS
SELECT 
    user_id,
    item_id,
    category_id,
    behavior_type,
    ts,
    FROM_UNIXTIME(ts) AS event_time,               
    DATE(FROM_UNIXTIME(ts)) AS event_date,         
    HOUR(FROM_UNIXTIME(ts)) AS event_hour,         
    DAYOFWEEK(FROM_UNIXTIME(ts)) AS event_weekday  
FROM user_behavior_sample
WHERE ts BETWEEN UNIX_TIMESTAMP('2017-11-25 00:00:00') AND UNIX_TIMESTAMP('2017-12-03 23:59:59');