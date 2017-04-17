# minimalStreamingBox

The essentials to testing a Spark Streaming application with Kafka. What's in this vagrant box:

* Spark 2.1.0
* HDFS 2.7.1
* Kafka 0\.10\.2\.0
* Zookeepr 3.4.9

Made from following two projects

* [HDFS/Spark Workbench](https://github.com/guicaro/docker-hadoop-spark-workbench)
* [kafka-docker](https://github.com/wurstmeister/kafka-docker)

# Prerequisites

* [Install Vagrant](https://www.vagrantup.com/downloads.html)
* [Install Virtualbox](https://www.virtualbox.org/wiki/Downloads)

# Quickstart

After installing Vagrant and Virtual box just start the vagrant box and start the docker containers. Notice that `dos2unix` is used if you have cloned this project to a Windows host. This should ideally be put into provisioning step, but vagrant has issues viewing contents of shared folder `/vagrant` 

`vagrant up`  
`vagrant ssh`  
`dos2unix /vagrant/start-all.sh`  
`dos2unix /vagrant/stop-all.sh`  
`cp /vagrant/st* ~`  
`chmod 755 st*`  
`./start_all.sh`  

You should end up with 6 containers running.

# Links

* HDFS UI: [http://localhost:50070](http://localhost:50070)
* Spark Master: [http://localhost:8080](http://localhost:8080)

# Kafka commands

TODO

# HDFS commands

TODO

# Connecting intelliJ

TODO
