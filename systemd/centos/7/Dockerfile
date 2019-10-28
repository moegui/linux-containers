FROM centos:7

ARG SSH_PUB_KEY

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done) \
  && rm -f /lib/systemd/system/local-fs.target.wants/* \
  && rm -f /lib/systemd/system/sockets.target.wants/*udev* \
  && rm -f /lib/systemd/system/sockets.target.wants/*initctl* \
  && rm -f /lib/systemd/system/basic.target.wants/* \
  && rm -f /lib/systemd/system/anaconda.target.wants/* \
  && yum update -y \
  && yum install -y openssh-server net-tools openssh-clients git sudo \
  && yum clean all \
  && echo "%wheel        ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/devops \
  && useradd -G wheel centos \
  && systemctl mask serial-getty@ttyS0.service \
  && systemctl enable sshd

USER centos

RUN mkdir /home/centos/.ssh \
  && echo $SSH_PUB_KEY > /home/centos/.ssh/authorized_keys

USER root

VOLUME [ "/sys/fs/cgroup", "/var/lib/docker" ]

EXPOSE 22 80 443 8080 8443

CMD ["/usr/sbin/init"]