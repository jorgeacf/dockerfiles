curl -X POST -H "Content-Type: application/json" \
	spark:8998/batches \
	--data '{"file": "/spark-1.0-SNAPSHOT-jar-with-dependencies.jar", "className": "com.jorgefigueiredo.operators.Main", "name": "MY HDFS Scala Livy Pi Example", "executorCores":1, "executorMemory":"512m", "driverCores":1, "driverMemory":"512m", "queue":"default", "args":["10"]}'