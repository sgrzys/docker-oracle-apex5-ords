# Set the base image to use to Ubuntu
FROM ubuntu:14.04.1

# Set the file maintainer (your name - the file's author)
MAINTAINER isabolic

# Update the default application repository sources list
RUN apt-get update

ADD assets /assets
RUN /assets/setup.sh

EXPOSE 22
EXPOSE 1521
EXPOSE 8080

CMD /usr/sbin/startup.sh && /usr/sbin/sshd -D
