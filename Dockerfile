FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install wget -y

RUN wget http://mirrors.ukfast.co.uk/sites/ftp.apache.org/kafka/1.1.0/kafka_2.11-1.1.0.tgz
RUN tar -xzf kafka_2.11-1.1.0.tgz

RUN apt-get install openjdk-8-jre  -y

WORKDIR kafka_2.11-1.1.0
COPY config/server.properties config/server.properties
COPY config/zookeeper.properties config/zookeeper.properties

COPY bootstrap.sh .

EXPOSE 2181 9092
CMD ./bootstrap.sh