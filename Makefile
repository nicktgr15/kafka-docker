

kafka_2.11-1.1.0:
	wget http://mirrors.ukfast.co.uk/sites/ftp.apache.org/kafka/1.1.0/kafka_2.11-1.1.0.tgz
	tar -zxf kafka_2.11-1.1.0.tgz

build:
	docker build . -t kafka-docker

run:
	docker run -p 2181:2181 -p 9092:9092 -v /tmp/kafka:/tmp/kafka-logs -v /tmp/zookeeper:/tmp/zookeeper -it kafka-docker

list_topics: kafka_2.11-1.1.0
	kafka_2.11-1.1.0/bin/kafka-topics.sh --list --zookeeper localhost:2181

create_topic: kafka_2.11-1.1.0
	kafka_2.11-1.1.0/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic test
