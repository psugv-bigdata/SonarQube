#Specify the image source
FROM ubuntu:latest

#Update the ubuntu repository and install softwares
RUN apt-get update &&\
apt-get install -y wget unzip default-jre

#Download the sonarqube zip file
RUN wget http://dist.sonar.codehaus.org/sonarqube-5.1.zip
RUN unzip sonarqube-5.1.zip
RUN mv sonarqube-5.1 /opt/sonar

#Set the connection properties to connect to the POSTGRESQL database .
COPY sonar.properties /opt/sonar/conf/sonar.properties

#Start Sonar
CMD ["/opt/sonar/bin/linux-x86-64/sonar.sh", "start"]

#Keep the linux container running
CMD while true; do sleep 1000; done

#Port to connect to SonarQube
EXPOSE 7228
