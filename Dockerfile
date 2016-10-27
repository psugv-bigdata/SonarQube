#Specify the image source
FROM ubuntu:latest

#Update the ubuntu repository and install softwares
RUN apt-get update &&\
apt-get install -y wget unzip default-jre postgresql-client-common

#Download the sonarqube zip file
RUN wget http://dist.sonar.codehaus.org/sonarqube-5.1.zip
RUN unzip sonarqube-5.1.zip
RUN mv sonarqube-5.1 /opt/sonar

#Set the connection properties file inside the container.
COPY sonar.properties /opt/sonar/conf/sonar.properties
COPY sonar-runner.properties /opt/sonar-runner/conf/sonar-runner.properties

#Get Sonar-Runner zip file
RUN wget http://repo1.maven.org/maven2/org/codehaus/sonar/runner/sonar-runner-dist/2.4/sonar-runner-dist-2.4.zip && \
    unzip sonar-runner-dist-2.4.zip && \
    mkdir /opt/sonar-runner && \
    mv /sonar-runner-2.4/* /opt/sonar-runner/ && \
    rm /sonar-runner-dist-2.4.zip && \
    rm /sonar-runner-2.4

ENV PATH /usr/local/sonar-runner-2.4/bin:$PATH

#Start Sonar
CMD ["/opt/sonar/bin/linux-x86-64/sonar.sh", "start"]

#Keep the linux container running
CMD while true; do sleep 1000; done

#Port to connect to SonarQube
EXPOSE 4321 
