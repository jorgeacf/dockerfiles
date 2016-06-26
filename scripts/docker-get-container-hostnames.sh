
docker ps -a -f status=running


docker inspect --format='{{.Name}}' $(sudo docker ps -aq --no-trunc)