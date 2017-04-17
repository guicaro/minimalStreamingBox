#!/bin/bash          

export KAFKA_HEAP_OPTS="-Xmx512M -Xms128M"
export KAFKA_ADVERTISED_HOST_NAME=localhost

cd ~/kafka-docker && sudo docker-compose up -d
cd ~/docker-hadoop-spark-workbench && sudo docker-compose -f docker-compose-java8.yml up -d
