# Flink

# 1.14版本以后官方已支持多架构版本，建议使用官方版本
https://hub.docker.com/_/flink?tab=tags

---

原始配置来源 https://github.com/apache/flink-docker

# 构建示例

进入想构建的版本目录，执行以下命令，替换${version}为具体的版本号
```
docker build --no-cache -t martindai/flink:${version} .
```

