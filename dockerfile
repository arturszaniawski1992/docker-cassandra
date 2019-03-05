# Base operating system image
FROM centos:latest
ADD src/datastax.repo /etc/yum.repos.d/datastax.repo
ADD src/start.sh /usr/local/bin/start.sh
RUN yum install -y java-1.7.0-openjdk-devel.x86_64 which && yum install -y dsc20 && mkdir -p /home/cassandra && chown cassandra:cassandra /home/cassandra && usermod --home /home/cassandra cassandra 
ENV HOME /home/cassandra
USER cassandra
CMD start.sh