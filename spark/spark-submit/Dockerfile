FROM elaaf/spark-base:latest

ENV DRIVER_MEMORY=4g
ENV DRIVER_CORES=1
ENV DEPLOY_MODE=client

ENTRYPOINT $SPARK_HOME/bin/spark-submit \
--master $SPARK_MASTER_URL \
--deploy-mode $DEPLOY_MODE \
--driver-memory $DRIVER_MEMORY \
--driver-cores $DRIVER_CORES $JOB_PATH