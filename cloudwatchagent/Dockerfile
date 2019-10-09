FROM centos:7

ADD https://s3.amazonaws.com/amazoncloudwatch-agent/centos/amd64/latest/amazon-cloudwatch-agent.rpm /tmp
RUN rpm -U /tmp/amazon-cloudwatch-agent.rpm
CMD /opt/aws/amazon-cloudwatch-agent/bin/start-amazon-cloudwatch-agent
