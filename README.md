# SonarQube
- This is a step by step guide to start a docker container for Sonar and Sonar-Runner on Ubuntu 16.04 Container.
- Please ensure that you have the corresponding Dockerfile before following the procedure steps.
- SonarQube will be running on port 4321 inside the docker container and the host port to access it is 4321.
- You should deploy your application data /mnt/Tomcat/webapps directory and ensure that the configuration for servelets & jsp pages is correct.
- Sonar-Runner properties should be modified with the project path which should be mapped to correct folder in container.

Steps:
------
1. Ensure that docker is installed on your host machine.
2. Ensure that the Dockerfile is placed in required directory. Usually it is best practice to keep it in your /home.
3. Make sure that the file is spelled correctly i.e "Dockerfile". If file has other name, extension then this doesn't work
4. We need to build the image before it can be deployed in the docker engine. Navigate to directory where the Docker file is placed and run the below command :

- $ docker build .

* Note the image id at displayed by docker at the end of the successful build. It should be something similar to this 85f9ce11db88. 

* The container can be deployed/run on the host machine using the below command. Note tomcat apps will be analyzed by sonarqube:
- $ docker run --name sonarqube -d -p 4321:4321 -v /mnt/Tomcat/:/Tomcat/ 6fecc596374c

* Please note your image id may be different than 6fecc596374c

* -d switch runs image in detached mode and -p forwards the hostport:destination port likewise.
* -v switch is used to mount volumes from host inside the container filesystem

* You can check status of available containers and images using command to see the
- $ docker ps -a

-You should see the name of your container with the associated Container id with current status

* Allow connections to specified port on the host machine using the following command:
- $ sudo ufw allow 4321

* You can now connect to this host machine and host your application inside the Apache Tomcat Server using the following url,
http://192.168.100.15:4321/sonar
