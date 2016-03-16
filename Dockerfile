# Set the base image to use to Ubuntu
FROM ubuntu:14.04.1

# Set the file maintainer (your name - the file's author)
MAINTAINER isabolic

# Update the default application repository sources list
RUN apt-get update
RUN apt-get install -y openjdk-7-jre tomcat7

ADD assets /assets
RUN /assets/setup.sh

EXPOSE 22
EXPOSE 1521
EXPOSE 8080
EXPOSE 80

CMD /usr/sbin/startup.sh && /usr/sbin/sshd -D && /usr/sbin/startup_tomcat.sh
