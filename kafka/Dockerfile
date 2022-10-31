FROM openjdk:11-jre-slim-buster

RUN apt-get update && \
    apt-get install -y bash curl tini vim

ARG version

WORKDIR /tmp

RUN curl -O https://dlcdn.apache.org/kafka/${version}/kafka_2.13-${version}.tgz && \
    tar zxf kafka_2.13-${version}.tgz -C /home && \
    mv /home/kafka_2.13-${version} /home/kafka && \
    rm kafka_2.13-${version}.tgz

WORKDIR /home/kafka

COPY ./start.sh ./

USER root

EXPOSE 9092 9093
ENTRYPOINT ["tini", "--", "/home/kafka/start.sh"]
