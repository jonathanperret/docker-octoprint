FROM arm32v7/python:2.7-jessie

RUN mkdir -p /data

RUN virtualenv /data/env

RUN git clone --branch 1.3.6 https://github.com/foosel/OctoPrint.git /data/OctoPrint

ENV VIRTUAL_ENV=/data/env
ENV PATH=/data/env/bin:$PATH

RUN cd /data/OctoPrint && python setup.py install

COPY default-config.yaml /data/config.yaml

VOLUME /data
WORKDIR /data
EXPOSE 5000

CMD ["octoprint", "serve", "--iknowwhatimdoing", "--basedir", "/data"]
