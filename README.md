# Docker commands to run Spark containers

### Run Spark Master
```
docker pull elaaf/spark-master

docker run -p 8080:8080 --expose 7077 --hostname spark-master --name spark-master --network spark-net elaaf/spark-master
```

### Run Spark Worker(s)
```
docker pull elaaf/spark-worker

docker run -p 8081:8081 --hostname spark-worker-1 --name spark-worker-1 --network spark-net elaaf/spark-worker
docker run -p 8082:8081 --hostname spark-worker-2 --name spark-worker-2 --network spark-net elaaf/spark-worker
```