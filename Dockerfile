
FROM ubuntu:latest

RUN apt-get update &&\
apt-get install -y wget unzip default-jre
RUN wget http://dist.sonar.codehaus.org/sonarqube-5.1.zip
RUN unzip sonarqube-5.1.zip
RUN mv sonarqube-5.1 /opt/sonar

COPY sonar.properties /opt/sonar/conf/
ENTRYPOINT ["/opt/sonar/bin/linux-x86-64/sonar.sh", "start"]
EXPOSE 9000
