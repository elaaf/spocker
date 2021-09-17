FROM elaaf/alpine:latest
LABEL maintainer="Elaaf Shuja <elaaf.shuja@gmail.com>"

# Install Spark
RUN wget https://downloads.apache.org/spark/spark-3.1.2/spark-3.1.2-bin-hadoop3.2.tgz \
    && mkdir spark \
    && tar -xvf spark-3.1.2-bin-hadoop3.2.tgz -C ./spark --strip-components 1 \
    && rm spark*.tgz

# SET ENV VARIABLES
ENV SPARK_HOME=/spark
ENV PATH=$SPARK_HOME/bin:$PATH
ENV SPARK_MASTER_URL=spark://spark-master:7077

# Final Stuff
ENTRYPOINT ["/bin/bash"]