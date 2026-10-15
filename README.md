一、项目背景：
本项目基于阿里天池淘宝用户行为公开数据集，原始数据约 1.0015 亿条。采用用户 ID 取模的用户级抽样方式，获得约 100.2 万条行为记录，覆盖 9,895 名用户，并对 2017 年 11 月 25 日至 12 月 3 日的用户行为进行清洗与分析。
二、数据与工具：
MySQL 8.0 + Python (Pandas, Seaborn, Matplotlib) + Jupyter。

三、分析模块：
数据清洗与时间维度处理
用户行为路径转移矩阵（热力图）
同期群留存分析（Cohort Analysis，含小样本清洗）

四、核心发现：


五、如何运行：
1. 环境依赖

Python 3.10+

MySQL 8.0+

所需 Python 库：pip install -r requirements.txt

2. 数据准备

原始数据：由于原始数据集过大（约 3.7GB），未包含在此仓库中。请从 阿里天池 - UserBehavior 下载。

数据导入：

在 MySQL 中执行 sql/01_create_raw_table.sql 建表。
使用 LOAD DATA LOCAL INFILE 命令将 CSV 导入 user_behavior 表。
执行 sql/02_create_sample_table.sql 和 sql/03_create_clean_table.sql 进行抽样和数据清洗。
3. 配置数据库连接

在项目根目录创建 .env 文件（可参考项目中的 .env.example 模板），填写你自己的 MySQL 凭证：

env
MYSQL_USER=root
MYSQL_PASSWORD=你的密码
MYSQL_HOST=localhost
MYSQL_PORT=3306
MYSQL_DB=taobao
4. 运行 Notebook

按顺序执行 notebooks/ 目录下的 Jupyter Notebook：

01_data_exploration.ipynb：数据质量检查与时间分布。

02_funnel_analysis.ipynb：转化漏斗与用户路径矩阵。

03_cohort_analysis.ipynb：同期群留存矩阵与可视化。

5. 注意事项

为保证性能，建议在 user_behavior_sample（100万行）表上进行探索性分析。

如需在 1 亿行全量数据上跑，请确保机器内存充足或增加 SQL 超时时间。

