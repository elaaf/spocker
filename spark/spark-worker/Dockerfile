FROM elaaf/spark-base:latest

ENTRYPOINT $SPARK_HOME/sbin/start-worker.sh $SPARK_MASTER_URL && tail -f $SPARK_HOME/logs/spark*.out