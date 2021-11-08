# pull the blue ocean image
FROM jenkinsci/blueocean 
FROM ubuntu

# build the container
USER root

# install wget
RUN apt-get update && \ 
    apt-get install -y wget

# get maven 3.5.4
RUN wget --no-verbose -O /tmp/apache-maven-3.5.4-bin.tar.gz http://apache.cs.utah.edu/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz

# verify checksum
# RUN echo "35c39251d2af99b6624d40d801f6ff02 /tmp/apache-maven-3.5.4-bin.tar.gz" md5sum -c

# install maven
RUN tar xzf /tmp/apache-maven-3.5.4-bin.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.5.4 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.5.4-bin.tar.gz
ENV MAVEN_HOME /opt/maven
ENTRYPOINT [ "java", "-jar", "/" ]

# add user
RUN useradd -ms /bin/bash jenkins
RUN chown -R jenkins:jenkins /opt/maven
EXPOSE 8000 

# remove download archive files
RUN apt-get clean

