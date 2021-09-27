# Dockerized Spark Standalone Implementation

This folder contains the following Dockerfiles:

- [spark-base](/spark-base)
- [spark-master](/spark-master)
- [spark-worker](/spark-worker)
- [spark-submit](/spark-submit)

You can build the docker images using these Dockerfiles yourself OR `docker pull` them from Docker Hub.

## Pull Docker Images

Run the following commands to pull the latest docker images for spark-master, spark-worker and spark-submit.

```bash
docker pull elaaf/spark-master
```

```bash
docker pull elaaf/spark-worker
```

```bash
docker pull elaaf/spark-submit
```

## Single-Host Spocker Setup

```bash
docker-compose -f spark/single-host-docker-compose/docker-compose.yml up
```

## Multi-Host Spocker Setup

```bash
docker stack deploy <STACK-NAME> --compose-file /spark/docker-compose.yml
```