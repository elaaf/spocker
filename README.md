# Pull the latest docker image
docker pull elaafshuja/spark

# Create a Bridge Network
docker network create --driver bridge spark-net

# Run master container
docker run -it --name master --network spark-net elaafshuja/spark