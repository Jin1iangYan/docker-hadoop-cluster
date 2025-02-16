# 设置Hadoop的安装目录
export HADOOP_HOME=/export/server/hadoop

# 设置Java的安装目录
export JAVA_HOME=/export/server/jdk

# 设置Hadoop的配置目录
export HADOOP_CONF_DIR=/export/server/hadoop/etc/hadoop

# 设置Hadoop的日志目录
export HADOOP_LOG_DIR=/export/server/hadoop/logs

# 设置操作系统类型
export HADOOP_OS_TYPE=${HADOOP_OS_TYPE:-$(uname -s)}

# 设置其他Hadoop命令运行时的Java运行时选项
# 例如指定IPv4偏好
# export HADOOP_OPTS="-Djava.net.preferIPv4Stack=true"

# 设置用于Hadoop客户端的额外Java选项
# export HADOOP_CLIENT_OPTS=""

# 设置Hadoop类路径
# export HADOOP_CLASSPATH="/some/cool/path/on/your/machine"

# 设置是否将HADOOP_CLASSPATH放在官方CLASSPATH之前
# export HADOOP_USER_CLASSPATH_FIRST="yes"

# 设置是否使用客户端类加载器
# export HADOOP_USE_CLIENT_CLASSLOADER=true

# 设置Hadoop的额外工具
# export HADOOP_OPTIONAL_TOOLS="hadoop-kafka,hadoop-aws,hadoop-azure-datalake,hadoop-aliyun,hadoop-azure"

# 设置Hadoop的日志目录（主要用于守护进程的日志）
# export HADOOP_LOG_DIR=${HADOOP_HOME}/logs

# 设置Hadoop进程标识字符串，通常为$USER
# export HADOOP_IDENT_STRING=$USER

# 设置Hadoop停止守护进程后的等待时间（单位：秒）
# export HADOOP_STOP_TIMEOUT=5

# 设置PID文件存放目录
# export HADOOP_PID_DIR=/tmp

# 设置Hadoop根日志记录器
# export HADOOP_ROOT_LOGGER=INFO,console

# 设置Hadoop守护进程的根日志记录器
# export HADOOP_DAEMON_ROOT_LOGGER=INFO,RFA

# 设置Hadoop的安全日志记录器
# export HADOOP_SECURITY_LOGGER=INFO,NullAppender

# 设置Hadoop进程的优先级
# export HADOOP_NICENESS=0

# 设置Hadoop的授权策略文件
# export HADOOP_POLICYFILE="hadoop-policy.xml"

# 设置HDFS NameNode的JVM选项
# export HDFS_NAMENODE_OPTS="-Dhadoop.security.logger=INFO,RFAS"

# 设置HDFS SecondaryNameNode的JVM选项
# export HDFS_SECONDARYNAMENODE_OPTS="-Dhadoop.security.logger=INFO,RFAS"

# 设置HDFS DataNode的JVM选项
# export HDFS_DATANODE_OPTS="-Dhadoop.security.logger=ERROR,RFAS"

# 设置HDFS DataNode的安全用户
# export HDFS_DATANODE_SECURE_USER=hdfs

# 设置HDFS NFS3 Gateway的JVM选项
# export HDFS_NFS3_OPTS=""

# 设置HDFS端口映射器的JVM选项
# export HDFS_PORTMAP_OPTS="-Xmx512m"

# 设置ZKFailoverController的JVM选项
# export HDFS_ZKFC_OPTS=""

# 设置QuorumJournalNode的JVM选项
# export HDFS_JOURNALNODE_OPTS=""

# 设置HDFS Balancer的JVM选项
# export HDFS_BALANCER_OPTS=""

# 设置HDFS Mover的JVM选项
# export HDFS_MOVER_OPTS=""

# 设置HDFS路由器的JVM选项
# export HDFS_DFSROUTER_OPTS=""

# 设置HDFS存储容器管理器的JVM选项
# export HDFS_STORAGECONTAINERMANAGER_OPTS=""

# 设置Hadoop构建时的类路径
# export HADOOP_ENABLE_BUILD_PATHS="true"

# 限制用户执行特定的Hadoop命令
# export HDFS_NAMENODE_USER=hdfs

# 设置Hadoop注册表DNS的安全用户
# export HADOOP_REGISTRYDNS_SECURE_USER=yarn

# 设置Hadoop注册表DNS的额外选项
# export HADOOP_REGISTRYDNS_SECURE_EXTRA_OPTS="-jvm server"