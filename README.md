# 培训登记副本的在线核对与行级修复

各记录目录保存独立的合成业务资料。SQL 文件仅包含原始关系表与已有行。manifest.json 记录库角色、表、行数及运行参数。timeline.json 记录后续客户端行为、来源提交或故障，用 pos 表示可比较的到达次序。同一 pos 按数组顺序。提交位置由相应记录的业务字段指定。

## 接入协议

primary_ 和 replica_ 分别放两端原始关系。进度以已提交的 commit_pos 表示。replica_offset 只是副本声称已应用的最后位置，可用数据库实际数据核对。checkpoint.json 列两端可查询的固定断面及列和编码映射；该断面在演练开始之前已形成。编码只能用列出的规则及字典转换，来源缺失映射的区域不应该被猜作一致。lesson 下的 reg 保持外键完整，replica 中真实存在的坏引用可由维护纠正。
timeline 的 commit 表示主库实际提交，replicate 表示副本应用，repair 的修补依据为 inspect 指定的断面。read 的 min_pos 是客户端至少需要的数据位置，可按显式范围申请。“注册数相等”只是可能的原始采样值，记录未提供对差异的裁决。

## 本地资料

使用 Python 3.11.2 和内置 SQLite 3.40.1。以下命令从记录创建关系库，目标文件需要尚不存在。各角色可以作为独立 SQLite 文件读取。

~~~sh
python3 seed_db.py fixtures/same-count-drift-and-concurrent-catchup primary-local.db --role primary
python3 seed_db.py fixtures/same-count-drift-and-concurrent-catchup replica-local.db --role replica
~~~

使用 Python 的 sqlite3 打开新文件即可访问原始表。用 python3 -m unittest -v 核对资料可装载、表与原始记录一致、SQLite 可同时打开读写连接。后续事件保存在各自的原始记录中。
