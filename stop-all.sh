#!/bin/bash          

cd ~/kafka-docker && sudo docker-compose stop
cd ~/docker-hadoop-spark-workbench && sudo docker-compose -f docker-compose-java8.yml stop
