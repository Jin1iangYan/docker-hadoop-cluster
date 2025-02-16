# 设置Java的安装目录
export JAVA_HOME=/export/server/jdk

# 设置JobHistoryServer的最大堆内存大小（单位为MB），这里设置为1000MB
export HADOOP_JOB_HISTORYSERVER_HEAPSIZE=1000

# 设置Hadoop根日志记录器的日志级别和输出方式
# INFO: 日志级别为信息，RFA: 输出到文件
export HADOOP_ROOT_LOGGER=INFO,RFA

##
## 该文件作为所有mapred相关命令的hadoop-env.sh的覆盖配置
##
## 优先级规则：
##
## mapred-env.sh > hadoop-env.sh > 默认硬编码配置
##
## MAPRED_xyz > HADOOP_xyz > 默认硬编码配置
##

###
# Job History Server特定参数
###

# 设置JobHistoryServer的最大堆内存大小。如果未指定单位，默认单位为MB。
# 该值将被HADOOP_OPTS和MAPRED_HISTORYSERVER_OPTS中指定的Xmx设置覆盖。
# 默认值与HADOOP_HEAPSIZE_MAX相同。
#export HADOOP_JOB_HISTORYSERVER_HEAPSIZE=

# 设置启动HistoryServer时使用的JVM选项。
# 这些选项将附加到HADOOP_OPTS中指定的选项，因此可能会覆盖任何相似的HADOOP_OPTS中的标志。
#export MAPRED_HISTORYSERVER_OPTS=

# 设置JobHistoryServer的log4j日志配置
# Java属性: hadoop.root.logger
#export HADOOP_JHS_LOGGER=INFO,RFA