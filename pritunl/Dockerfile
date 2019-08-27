FROM centos:7

RUN echo -e "\
[pritunl] \n\
name=Pritunl Repository \n\
baseurl=https://repo.pritunl.com/stable/yum/centos/7/ \n\
gpgcheck=0 \n\
enabled=1 \
" > /etc/yum.repos.d/pritunl.repo

RUN yum -y install epel-release && \
    yum -y install pritunl && yum clean all

ARG PPORT=8443
ARG MHOST=pritunl_mongodb
ARG MPORT=27017
ARG MDB=pritunl

RUN echo -e "\
{ \n\
  \"debug\": false, \n\
  \"bind_addr\": \"0.0.0.0\", \n\
  \"port\": $PPORT, \n\
  \"log_path\": \"/var/log/pritunl.log\", \n\
  \"temp_path\": \"/tmp/pritunl_%r\", \n\
  \"local_address_interface\": \"auto\", \n\
  \"mongodb_uri\": \"mongodb://$MHOST:$MPORT/$MDB\" \n\
} \
" > /etc/pritunl.conf

RUN echo "* hard nofile 64000" >> /etc/security/limits.conf && \
    echo "* soft nofile 64000" >> /etc/security/limits.conf && \
    echo "root hard nofile 64000" >> /etc/security/limits.conf && \
    echo "root soft nofile 64000" >> /etc/security/limits.conf

CMD /usr/lib/pritunl/bin/pritunl start