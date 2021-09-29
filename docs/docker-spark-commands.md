# Docker commands to run Spark containers

## Run Spark Master
```docker
docker pull elaaf/spark-master
```
```docker
docker run -d -p 8080:8080 --expose 7077 --hostname spark-master --name spark-master --network spark-net \
--memory="4g" --cpus="2" elaaf/spark-master
```

## Run Spark Worker(s)

```docker
docker pull elaaf/spark-worker
```
```docker
# Worker-1
docker run -d -p 8081:8081 --hostname spark-worker-1 --name spark-worker-1 --network spark-net \
--memory="8g" --cpus="3" elaaf/spark-worker
# Worker-2
docker run -d -p 8082:8081 --hostname spark-worker-2 --name spark-worker-2 --network spark-net \
--memory="8g" --cpus="3" elaaf/spark-worker
```


## Spark-Submit
```docker
docker pull elaaf/spark-submit
```

Start a spark-submit ephemeral container
```docker
docker run -it \
--mount type=bind,src=$(pwd),dst=/spocker/ \
--network spark-net -e JOB_PATH=/spocker/spark_submit_test_pi.py elaaf/spark-submit
```

OR

spark-submit to a Running container

```docker
docker exec <container-name> spark-submit $SPARK_MASTER_URL --deploy-mode client --driver-memory 4g --driver-cores 1 /spocker/spark_submit_test_pi.py
```


## MISC Spark Commands
spark-submit bash commands:
```bash
spark-submit --master spark://spark-master:7077 --deploy-mode client --driver-memory 4g --driver-cores 1 <JOB_PATH>
```
Using the SPARK_MASTER_URL env variable.
```bash
spark-submit $SPARK_MASTER_URL --deploy-mode client --driver-memory 4g --driver-cores 1 <JOB_PATH>
```


