# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM maven:3.8.4-jdk-8-slim as builder
RUN apt-get update && \
    apt-get install -y wget unzip

ARG version
RUN mkdir /source && \
    wget https://github.com/apache/dubbo-admin/archive/${version}.zip && \
    unzip -q ${version}.zip -d /source && \
    mv /source/dubbo-admin-${version} /source/dubbo-admin

WORKDIR /source/dubbo-admin
COPY ./settings-docker.xml /usr/share/maven/ref/
RUN mvn --batch-mode clean package -DskipTests -s /usr/share/maven/ref/settings-docker.xml dependency:resolve
WORKDIR /source/dubbo-admin/dubbo-admin-distribution/target
RUN mv ./dubbo-admin-${version}.jar ./app.jar

FROM openjdk:8-alpine
RUN apk add --no-cache tini bash
COPY --from=builder /source/dubbo-admin/dubbo-admin-distribution/target/app.jar /app.jar
COPY --from=builder /source/dubbo-admin/docker/entrypoint.sh /usr/local/bin/entrypoint.sh

ENV JAVA_OPTS ""

ENTRYPOINT ["tini", "--", "/usr/local/bin/entrypoint.sh"]
EXPOSE 8080
