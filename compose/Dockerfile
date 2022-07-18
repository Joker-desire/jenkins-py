FROM jenkinsci/blueocean

COPY ./initPipenv.sh /tmp/

ENV LANG C.UTF-8
ENV TZ Asia/Shanghai

USER root

RUN apk update && \
    apk add python3 && \
    wget https://bootstrap.pypa.io/get-pip.py && python3 get-pip.py && \
    pip3 install --upgrade pip && pip3 install pipenv && \
    `curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | sh`

ENV PATH=/root/.pyenv/bin:$PATH

WORKDIR /var/jenkins_home/jobs