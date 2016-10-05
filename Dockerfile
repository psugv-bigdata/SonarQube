FROM ubuntu:latest

RUN echo "mysql-server mysql-server/root_password password docker" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password docker" | debconf-set-selections

#RUN /usr/bin/mysql_secure_installation
RUN apt-get -y install mysql-server

# Define mountable directories.
VOLUME ["/etc/mysql", "/var/lib/mysql"]

#Launch mysql after a reboot
RUN /usr/sbin/update-rc.d mysql defaults

CMD ["/usr/bin/tail","-f", "/dev/null"]

RUN service mysql restart
EXPOSE 3306
EXPOSE 8080
