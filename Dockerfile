FROM ubuntu:22.04

WORKDIR /root

ENV HADOOP_HOME=/export/server/hadoop
ENV JAVA_HOME=/export/server/jdk
ENV HIVE_HOME=/export/server/hive
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$HIVE_HOME/bin

# 创建 hadoop 用户并设置密码
RUN useradd -m -s /bin/bash hadoop && \
    echo "hadoop:hadoop" | chpasswd && \
    echo "root:root" | chpasswd

# 动态配置APT源（根据架构选择）
RUN arch=$(dpkg --print-architecture) && \
    if [ "$arch" = "amd64" ]; then \
        base_url="https://mirrors.tuna.tsinghua.edu.cn/ubuntu/"; \
    else \
        base_url="https://mirrors.tuna.tsinghua.edu.cn/ubuntu-ports/"; \
    fi && \
    echo "deb ${base_url} jammy main restricted universe multiverse" > /etc/apt/sources.list && \
    echo "deb-src ${base_url} jammy main restricted universe multiverse" >> /etc/apt/sources.list

# 禁用 SSL 验证
RUN echo 'Acquire::https::Verify-Peer "false";' > "/etc/apt/apt.conf.d/99disable-ssl"

# 安装依赖并设置Java软链接
RUN apt-get update && \
    apt-get install -y vim ssh net-tools telnet openjdk-8-jdk wget && \
    mkdir -p /export/server && \
    ln -s /usr/lib/jvm/java-8-openjdk-$(dpkg --print-architecture) ${JAVA_HOME}

# 允许通过密码登录root用户
RUN echo "PermitRootLogin yes" >> "/etc/ssh/sshd_config"

# 安装 Hadoop
RUN mkdir -p /export/server
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then \
        wget https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/core/hadoop-3.3.6/hadoop-3.3.6.tar.gz; \
    elif [ "$ARCH" = "aarch64" ]; then \
        wget https://mirrors.tuna.tsinghua.edu.cn/apache/hadoop/core/hadoop-3.3.6/hadoop-3.3.6-aarch64.tar.gz; \
    else \
        echo "Unsupported architecture: $ARCH" && exit 1; \
    fi

# 解压并移动到 HADOOP_HOME，创建软链接
RUN tar -xzf hadoop-3.3.6*.tar.gz && \
    mv hadoop-3.3.6 /export/server/hadoop-3.3.6 && \
    rm hadoop-3.3.6*.tar.gz && \
    ln -s /export/server/hadoop-3.3.6 ${HADOOP_HOME}

# 拷贝hadoop配置文件
COPY config/* ${HADOOP_HOME}/etc/hadoop/

# 创建namenode和datanode目录
RUN mkdir -p /data/nn /data/dn
RUN chown -R hadoop:hadoop /data && \
    chown -R hadoop:hadoop /export

# 安装Hive
RUN wget https://mirrors.tuna.tsinghua.edu.cn/apache/hive/hive-4.0.1/apache-hive-4.0.1-bin.tar.gz;
RUN tar -xzf apache-hive-4.0.1-bin.tar.gz && \
    mv apache-hive-4.0.1-bin /export/server/apache-hive-4.0.1-bin && \
    rm apache-hive-4.0.1-bin.tar.gz
COPY mysql-connector-java-8.0.21.jar /export/server/apache-hive-4.0.1-bin/lib
RUN ln -s /export/server/apache-hive-4.0.1-bin $HIVE_HOME
RUN mkdir $HIVE_HOME/logs
RUN chown -R hadoop:hadoop $HIVE_HOME /export/server/apache-hive-4.0.1-bin
# 移除冲突的日志库
RUN rm -fr ${HIVE_HOME}/lib/log4j-slf4j-impl-2.18.0.jar

USER hadoop
WORKDIR /home/hadoop

# 配置SSH免密登录
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# 设置环境变量
RUN echo "export HADOOP_HOME=/export/server/hadoop" >> ~/.bashrc && \
    echo "export JAVA_HOME=/export/server/jdk" >> ~/.bashrc && \
    echo "export HIVE_HOME=/export/server/hive" >> ~/.bashrc && \
    echo 'export PATH="${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin:${HIVE_HOME}/bin"' >> ~/.bashrc

# Hive快捷链接beeline
RUN echo 'alias hive="${HIVE_HOME}/bin/beeline -u jdbc:hive2://node1:10000 -n hadoop"' >> ~/.bashrc

# 拷贝示例文件
COPY example/* example/
COPY cmd/* cmd/

USER root
# 启动服务
CMD [ "sh", "-c", "service ssh start; bash"]