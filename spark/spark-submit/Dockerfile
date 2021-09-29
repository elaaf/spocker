FROM elaaf/spark-base:latest

ENV DRIVER_MEMORY=2g
ENV DRIVER_CORES=1
ENV DEPLOY_MODE=client
ENV NUM_EXECUTORS=2
ENV EXECUTOR_MEMORY=2g
ENV EXECUTOR_CORES=1

ENTRYPOINT $SPARK_HOME/bin/spark-submit \
--master $SPARK_MASTER_URL \
--deploy-mode $DEPLOY_MODE \
--driver-memory $DRIVER_MEMORY \
--driver-cores $DRIVER_CORES \
--num-executors $NUM_EXECUTORS \
--executor-memory $EXECUTOR_MEMORY \
--executor-cores $EXECUTOR_CORES \
$JOB_PATH