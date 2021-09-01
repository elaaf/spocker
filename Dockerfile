FROM alpine:latest

LABEL maintainer="Elaaf Shuja <elaaf.shuja@gmail.com>"

# Install Spark
RUN wget https://downloads.apache.org/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz \
    && mkdir spark \
    && tar -xvf spark-3.1.2-bin-hadoop3.2.tgz -C ./spark --strip-components 1 \
    && rm spark*.tgz

# Install requirements (Java8, Python, utils:nohup)
RUN apk add --no-cache openjdk8-jre python3 bash coreutils procps

# SET ENV VARIABLES
ENV SPARK_HOME=/spark
ENV PATH=$SPARK_HOME/sbin:$PATH
ENV JAVA_HOME=/usr
ENV SPARK_CLUSTER_URL = "spark://master:7077"

# Final Stuff
ENTRYPOINT ["/bin/bash"]