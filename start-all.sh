#!/bin/bash          

cd ~/kafka-docker && sudo docker-compose up -d
cd ~/docker-hadoop-spark-workbench && sudo docker-compose -f docker-compose-java8.yml up -d
