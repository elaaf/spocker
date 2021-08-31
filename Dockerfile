FROM alpine:latest

LABEL maintainer="Elaaf Shuja <elaaf.shuja@gmail.com>"

# Install other requirements (Python, utils:nohup)
RUN apk add --no-cache bash
RUN apk add --no-cache python3
RUN apk add --no-cache --update coreutils procps

# Install Spark
RUN wget https://downloads.apache.org/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz
RUN mkdir spark && tar -xvf spark-3.1.2-bin-hadoop3.2.tgz -C ./spark --strip-components 1
RUN rm spark*.tgz

# Install Java
RUN apk add openjdk8


# SET ENV VARIABLES
ENV SPARK_HOME=/spark
ENV PATH=$SPARK_HOME/sbin:$PATH
ENV JAVA_HOME=/usr
ENV SPARK_CLUSTER_URL = "spark://master:7077"

# Final Stuff
ENTRYPOINT ["/bin/bash"]