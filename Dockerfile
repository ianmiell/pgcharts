FROM ubuntu:14.04

RUN apt-get update
RUN apt-get install -y -qq git python-pip
RUN pip install shutit

WORKDIR /opt
# Change the next two lines to build your ShutIt module.
RUN git clone https://github.com/ianmiell/pgcharts
WORKDIR /opt/pgcharts
RUN shutit build --delivery dockerfile

# Required to allow Cloudbees plugin to work - see: https://zwischenzugs.wordpress.com/?p=1283
RUN mkdir -p /var/jenkins_home/jobs/docker-test/workspace

CMD ["sleep infinity"]
