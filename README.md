# Spocker = Spark *on* Docker

Setup Spark using Docker.
<br><br>
This repository refers to Dockerized Spark as Spocker.


## Requirements

- Docker - on (all) Linux Machine(s)

Install docker from [here](https://docs.docker.com/engine/install/) if required.

## Quick Start

### Single-Host Spark Standalone

For a single-node Spark Standalone setup, run the following commands.
This runs the spark-master, and spark-worker containers on the same machine/docker-host.

- First, clone this repo
```bash
git clone https://github.com/elaaf/spocker.git
```

- Execute the docker-compose.yml
```bash
docker-compose -f spark/single-host-docker-compose/docker-compose.yml up
```

### Multi-Host Spark Standalone

- Setup the Docker Swarm
- Execute the `docker stack` deployment configuration

Refer to [this](/docs/docker-spark-get-started.md) for the step-by-step guide.