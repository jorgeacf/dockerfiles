
export HOST_IP=172.17.0.1

echo "=============zookeeper==============="
docker run -itd \
  -e SERVER_ID=1 \
  -e ADDITIONAL_ZOOKEEPER_1=server.1=1.1.1.1:2888:3888 \
  -e ADDITIONAL_ZOOKEEPER_2=server.2=1.1.1.1:2888:3888 \
  -e ADDITIONAL_ZOOKEEPER_3=server.3=1.1.1.1:2888:3888 \
  -p 2181:2181 \
  -p 2888:2888 \
  -p 3888:3888 \
  garland/zookeeper

echo "=============mesos-master==============="
docker run \
  -p 5050:5050 \
  -e "MESOS_HOSTNAME=${HOST_IP}" \
  -e "MESOS_IP=${HOST_IP}" \
  -e "MESOS_ZK=zk://${HOST_IP}:2181/mesos" \
  -e "MESOS_PORT=5050" \
  -e "MESOS_LOG_DIR=/var/log/mesos" \
  -e "MESOS_QUORUM=1" \
  -e "MESOS_REGISTRY=in_memory" \
  -e "MESOS_WORK_DIR=/var/lib/mesos" \
  -itd \
  garland/mesosphere-docker-mesos-master

echo "=============marathon==============="
 docker run \
 -itd \
 -p 8080:8080 \
 garland/mesosphere-docker-marathon --master zk://${HOST_IP}:2181/mesos --zk zk://${HOST_IP}:2181/marathon

echo "=============mesos-slave==============="
  docker run -itd \
 --entrypoint="mesos-slave" \
 -e "MESOS_MASTER=zk://${HOST_IP}:2181/mesos" \
 -e "MESOS_LOG_DIR=/var/log/mesos" \
 -e "MESOS_LOGGING_LEVEL=INFO" \
 garland/mesosphere-docker-mesos-master:latest