# minimalStreamingBox

The essentials to testing a Spark Streaming application with Kafka. What's in this vagrant box:

* Spark 2.1.0
* HDFS 2.7.1
* Kafka 0\.10\.2\.0
* Zookeepr 3.4.9

Made from following two projects

* [HDFS/Spark Workbench](https://github.com/guicaro/docker-hadoop-spark-workbench) (Please note this a fork w/ some additional changes from original)
* [kafka-docker](https://github.com/wurstmeister/kafka-docker)

# Prerequisites

* [Install Vagrant](https://www.vagrantup.com/downloads.html)
* [Install Virtualbox](https://www.virtualbox.org/wiki/Downloads)

# Quickstart

After installing Vagrant and Virtual box just start the vagrant box and start the docker containers. Notice that `dos2unix` is used if you have cloned this project to a Windows host. This should ideally be put into provisioning step, but vagrant has issues viewing contents of shared folder `/vagrant` 

`vagrant up`  
`vagrant ssh`  

### Inside vm

`dos2unix /vagrant/start-all.sh`  
`dos2unix /vagrant/stop-all.sh`  
`cp /vagrant/st* ~`  
`chmod 755 st*`  

### Kafka config

1. Get the IP for your Ubuntu box (in the form 10.X.X.X): `ifconfig | grep 10`
2. Modify `KAFKA_ADVERTISED_HOST_NAME: 192.168.99.100` in `~/kafka-docker/docker-compose.yml` with IP from step 1
3. If you are having memory issues, you might also want to add `KAFKA_HEAP_OPTS="-Xmx512M -Xms128M"`

### Run :)

`./start_all.sh`  

You should end up with 6 containers running.

# Links

* HDFS UI: [http://localhost:50070](http://localhost:50070)
* Spark Master: [http://localhost:8080](http://localhost:8080)

# Kafka commands

The kafka-docker project has included a script to run kafka commands inside a container. If you want more information refer to their [documentation](http://wurstmeister.github.io/kafka-docker/)

`~/kafka-docker/start-kafka-shell.sh 10.X.X.X 10.X.X.X:2181`

### Inside the Kafka container

`# Create a topic`  
`kafka-topics.sh --create --topic <topic_here> --partitions 4 --zookeeper $ZK --replication-factor 1`

`# Produce messages`  
`kafka-console-producer.sh --broker-list $HOST_IP:9092 --topic <topic_here>`  

`# Consume messages`  
`kafka-console-consumer.sh --new-consumer --bootstrap-server $HOST_IP:9092 --topic <topic_here>`  

`# Access Zookeeper`  
`zookeeper-shell.sh $ZK`  

# HDFS commands

To get access to the HDFS file system shell we can just use a datanode and interact using the [HDFS file system commands](https://hadoop.apache.org/docs/r2.7.1/hadoop-project-dist/hadoop-common/FileSystemShell.html) . Keep in mind that you can also [browse the file system](http://localhost:50070/explorer.html) with the browser

`docker exec -ti datanode bash`  

### Inside the datanode container

`hadoop fs -mkdir /myDir`  

# Connecting intelliJ

TODO
