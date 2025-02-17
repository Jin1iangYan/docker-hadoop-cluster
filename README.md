# Hadoop Cluster with Hive Integration (Docker)

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

A containerized Hadoop ecosystem featuring HDFS, YARN, MapReduce, and Hive, pre-configured for rapid deployment and big data experimentation. Includes automatic metastore initialization using MySQL for Hive metadata management.

## Features

- **Full Hadoop Stack**: HDFS 3.3.6 + YARN + MapReduce 3.3.6
- **Hive 4.0.1**: Integrated data warehouse with MySQL-backed metastore
- **Multi-Node Cluster**: 3-node architecture (node1, node2, node3)
- **Production-Ready Configs**:
  - 256MB HDFS block size
  - Fair Scheduler for YARN
  - Log aggregation enabled
- **Pre-Baked Security**:
  - SSH auto-configuration between nodes
  - HDFS directory permission hardening
- **Developer Friendly**:
  - Pre-loaded sample dataset
  - Beeline CLI alias for Hive access
  - Web UI ports pre-exposed

## Installation

### Prerequisites

- Docker Engine 20.10+
- Docker Compose 2.20+
- 8GB+ RAM allocated to Docker

### Deployment

1. **Modify `docker-compose.yml` Based on Architecture**:
   - For **arm64** architecture, use:
     ```yaml
     services:
       mysql:
         image: arm64v8/mysql:8.0
         hostname: mysql
     ```
   - For **amd64** architecture, use:
     ```yaml
     services:
       mysql:
         image: mysql:8.0
         hostname: mysql
     ```

2. **Build Base Image**:
   ```bash
   docker-compose build
   ```

3.	Launch Cluster:
  ```bash
  docker-compose up -d
  ```

4.	Verify Services:
  ```bash
  docker-compose ps
  ```

## Usage

### Cluster Access

**SSH to Master Node**:
```bash
docker exec -it node1 bash
su - hadoop  # Password: hadoop
```

### HDFS Operations

**Load Sample Data**:
```bash
hadoop fs -put ~/example /input

# Run WordCount (output to HDFS)
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-*.jar \
  wordcount /input/sample.txt /output/wc
```

### Hive Access

**Connect via Beeline**:
```bash
hive  # Pre-configured alias connects to HiveServer2
```

**Example Query**:
```sql
CREATE TABLE test (id INT, content STRING);
INSERT INTO test VALUES (1, 'hadoop'), (2, 'hive');
SELECT * FROM test;
```

### Web Interfaces

| Service              | URL                             |
|----------------------|---------------------------------|
| HDFS NameNode        | http://localhost:9870           |
| YARN ResourceManager | http://localhost:8088           |
| MapReduce JobHistory | http://localhost:19888          |
| HiveServer2          | jdbc:hive2://localhost:10000     |

## Configuration

### Key Files

| File                   | Purpose                                |
|------------------------|----------------------------------------|
| `config/core-site.xml` | Default FS (hdfs://node1:9000)         |
| `config/hive-site.xml` | MySQL metastore configuration          |
| `config/yarn-site.xml` | Fair Scheduler & log aggregation       |
| `docker-compose.yml`   | Cluster topology & resource allocation |

### Customization Workflow

1. Modify files in `config/`
2. Rebuild containers:
   ```bash
   docker-compose down && docker-compose build && docker-compose up -d
   ```

## Testing

### Validation Suite

1. **HDFS Health**:
   ```bash
   hdfs dfsadmin -report
   ```

2. **YARN Node Check**:
   ```bash
   yarn node -list
   ```

3. **Hive Metastore Test**:
   ```bash
   schematool -info -dbType mysql
   ```

## Contributing

1. Fork & create feature branch
2. Add tests for new features
3. Submit PR with documentation updates

## License

Apache 2.0 - See included license headers in configuration files.

## Acknowledgements

- Apache Hadoop, Hive, and MySQL projects
- Docker containerization ecosystem
- ARM64 compatibility testing community
