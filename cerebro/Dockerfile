FROM openjdk:11-jre-slim-buster

RUN apt-get update && \
    apt-get install -y bash curl unzip tini

ARG version

ENV CEREBRO_HOME /home/cerebro/cerebro-${version}

WORKDIR ${CEREBRO_HOME}

RUN curl -L https://github.com/lmenezes/cerebro/releases/download/v${version}/cerebro-${version}.zip -o cerebro.zip && \
    unzip cerebro.zip && \
    mv cerebro*/* .

WORKDIR ${CEREBRO_HOME}/bin

EXPOSE 9000
ENTRYPOINT ["tini", "--", "./cerebro"]
