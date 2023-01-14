FROM maven:3.8.2-openjdk-8 as build
ARG BUILD_VERSION=1.0.0
WORKDIR /lakshmi
COPY . .
RUN mvn clean package

FROM tomcat:9.0
ARG BUILD_VERSION=1.0.0
COPY --from=build /lakshmi/target/hello-world-war-${BUILD_VERSION}.war /usr/local/tomcat/webapps/
