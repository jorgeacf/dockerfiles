	

#spark-submit \
#  --class SparkPi \
#  --master yarn \
#  --deploy-mode client \  # can be client for client mode
#  --executor-memory 20G \
#  --num-executors 50 \
#  /opt/spark/lib/spark-examples-1.6.1-hadoop2.6.0.jar \
#  1000

run-example SparkPi 10