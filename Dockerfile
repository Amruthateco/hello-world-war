FROM maven:3.8.2-openjdk-8 as build_stage
WORKDIR /lakshmi
COPY . .
RUN mvn clean package

FROM tomcat:9.0
COPY --from=build_stage /lakshmi/target/hello-world-war-${BUILD_VERSION}.war /usr/local/tomcat/webapps/
