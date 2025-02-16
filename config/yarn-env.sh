export JAVA_HOME=/export/server/jdk
export HADOOP_HOME=/export/server/hadoop
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export HADOOP_LOG_DIR=$HADOOP_HOME/logs

##
## 该文件作为yarn命令的覆盖配置
##

### ResourceManager相关参数 ###
# 设置ResourceManager的最大堆内存大小
#export YARN_RESOURCEMANAGER_HEAPSIZE=

# 设置启动ResourceManager时的JVM选项
# export YARN_RESOURCEMANAGER_OPTS=

### NodeManager相关参数 ###
# 设置NodeManager的最大堆内存大小
#export YARN_NODEMANAGER_HEAPSIZE=

# 设置启动NodeManager时的JVM选项
# export YARN_NODEMANAGER_OPTS=

### TimeLineServer相关参数 ###
# 设置TimeLineServer的最大堆内存大小
#export YARN_TIMELINE_HEAPSIZE=

# 设置启动TimeLineServer时的JVM选项
# export YARN_TIMELINESERVER_OPTS=

### TimeLineReader相关参数 ###
# 设置启动TimeLineReader时的JVM选项
# export YARN_TIMELINEREADER_OPTS=

### Web App Proxy Server相关参数 ###
# 设置Web App Proxy Server的最大堆内存大小
#export YARN_PROXYSERVER_HEAPSIZE=

# 设置启动Proxy Server时的JVM选项
# export YARN_PROXYSERVER_OPTS=

### Shared Cache Manager相关参数 ###
# 设置启动Shared Cache Manager时的JVM选项
# export YARN_SHAREDCACHEMANAGER_OPTS=

### Router相关参数 ###
# 设置启动Router时的JVM选项
# export YARN_ROUTER_OPTS=

### Registry DNS相关参数 ###
# 已弃用，请在hadoop-env.sh中处理
# export YARN_REGISTRYDNS_SECURE_USER=yarn
# export YARN_REGISTRYDNS_SECURE_EXTRA_OPTS="-jvm server"

### YARN服务参数 ###
# YARN服务示例文件所在目录
# export YARN_SERVICE_EXAMPLES_DIR=$HADOOP_YARN_HOME/share/hadoop/yarn/yarn-service-examples
# export YARN_CONTAINER_RUNTIME_DOCKER_RUN_OVERRIDE_DISABLE=true