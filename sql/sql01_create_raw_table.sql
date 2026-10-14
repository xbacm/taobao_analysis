CREATE DATABASE IF NOT EXISTS taobao;
USE taobao;

CREATE TABLE user_behavior (
    user_id INT,
    item_id INT,
    category_id INT,
    behavior_type VARCHAR(10),
    ts INT
);