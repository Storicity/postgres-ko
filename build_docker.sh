#! /bin/zsh

image_name="postgres-ko"
container_name="Travis_DB_1"

echo "## Automation docker-database build and run ##"

echo "=> Remove previous container......."
docker rm -f ${container_name}

echo "=> Remove previous image......."
docker rmi -f ${image_name}

echo "=> Build new image........"
docker build -t ${image_name}:11.6 .

echo "=> Run container......"
docker run -p 5432:5432 --name ${container_name} ${image_name}:11.6