#!/bin/bash

# 设置环境变量
export HADOOP_HOME=/export/server/hadoop
export JAVA_HOME=/export/server/jdk
export HIVE_HOME=/export/server/hive
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$HIVE_HOME/bin

# 启动 Hadoop 集群
# 如果 /data/nn/current 目录不存在，则格式化 namenode
if [ ! -d "/data/nn/current" ]; then
    hdfs namenode -format
fi
start-dfs.sh
start-yarn.sh
mapred --daemon start historyserver

# 检查 Hive 数据库是否已初始化，如果没有则初始化
if ! schematool -info -dbType mysql; then
    schematool -initSchema -dbType mysql
fi

# 启动元数据管理服务
nohup hive --service metastore >> $HIVE_HOME/logs/metastore.log 2>&1 &

# 启动HiveServer2
nohup hive --service hiveserver2 >> $HIVE_HOME/logs/hiveServer2.log 2>&1 &
