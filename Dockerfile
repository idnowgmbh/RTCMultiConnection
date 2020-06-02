FROM docker.dev.idnow.de/bionic
LABEL maintainer="IDnow"
LABEL maintainer_email="dev@idnow.de"

RUN apt-get update -y
RUN apt-get install -y npm

COPY . /coaching
WORKDIR /coaching

RUN npm install

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["bash", "-c", "source ${BASE_PATH}/environment; /usr/bin/supervisord -n"]