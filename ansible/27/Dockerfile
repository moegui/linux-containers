FROM python:3-buster

ENV PATH="/opt/ansible/bin:${PATH}"
ENV PYTHONPATH="/opt/ansible/lib"
ENV MANPATH="/opt/ansible/docs/man"

RUN git clone --depth 1 --single-branch --branch stable-2.7 https://github.com/ansible/ansible.git /opt/ansible
RUN pip install --user -r /opt/ansible/requirements.txt
RUN pip install --user botocore boto boto3 cryptography lxml passlib