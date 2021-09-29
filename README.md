# Spocker : Spark *on* Docker

<p align="center">
    <img src=images/spocker-logo.png alt="Spocker: Spark on Docker">
</p>


Containerized Spark deployment using Docker.<br>
Kubernetes should be preferred as the orchestrator for prodcution systems over Docker-Swarm.<br>
This repository refers to containerized Spark as Spocker.


## Contents
* [Requirements](#requirements)
* [Single-Host Spark Standalone](#single-host-spark-standalone)
    + [1. Clone this repo](#1-clone-this-repo)
    + [2. Execute the docker-compose.yml](#2-execute-the-docker-composeyml)
    + [3. Submit a job to the single-host Spark cluster](#3-submit-a-job-to-the-single-host-spark-cluster)
* [Multi-Host Spark Standalone](#multi-host-spark-standalone)
    + [Detailed guide for Multi-Host Spark Standalone](/docs/docker-spark-get-started.md)

## Requirements

- Docker - on (all) Linux Machine(s)

Install docker from [here](https://docs.docker.com/engine/install/) if required.


## Single-Host Spark Standalone

To deploy and run Spark (Standalone) inside a single machine(host), run the following commands.
This runs the spark-master, and spark-worker containers on the same machine/docker-host.

### 1. Clone this repo
```bash
git clone https://github.com/elaaf/spocker.git
```

```bash
cd spocker
```

### 2. Execute the docker-compose.yml
```bash
docker-compose -f spark/single-host-docker-compose/docker-compose.yml up
```
This will pull the latest images for spark-master and spark-worker.
A [docker bridge network](https://docs.docker.com/network/bridge/) named `spark-net` will be created and joined by the containers.

![](images/spocker-single-host-architecture.png)

<br>

Three containers will be started on the host-machine:
- 1 x Spark-Master: WebUI @ Your-Machine-IP:8080
- 2 x Spark-Worker WEBUI @ Your-Machine-IP:8081 and Your-Machine-IP:8082


If the deployement was successful, the Spark WebUI should be accessible @ YOUR-IP:8080 and should look something like this:

![](images/spocker-single-host-webui.png)

### 3. Submit a job to the single-host Spark cluster

Start the spark-submit container, providing the SPARK_MASTER_URL (optional for single-host: defaults to `spark://spark-master:7077`) and JOB_PATH.<br>
The contianer will run till the submitted spark-job's life, hosting the spark-driver inside it.

```bash
docker run -it \
--network spark-net \
--mount type=bind,src=$(pwd),dst=/spocker/ \
-e JOB_PATH=/spocker/spark/spark-test-job/spark_submit_test_pi.py \
elaaf/spark-submit
```
The `--mount` command will mount (bind-type) the current directory at the path `/spocker/` inside the spark-submit docker container.<br>
This allows the container to access the code/py-files inside the mounted directory.<br>
The Spark WebUI will show a running application and will move it to completed on completion.



## Multi-Host Spark Standalone

To deploy and run Spark (Standalone) across a multiple machine(host), follow the following steps:

- Setup the Docker Swarm
- Execute the `docker stack` deployment configuration

#### Refer to [this](/docs/docker-spark-get-started.md) for the detailed guide on Multi-Host Spark Standalone deployment.