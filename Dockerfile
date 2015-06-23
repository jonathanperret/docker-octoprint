FROM hypriot/rpi-python:2.7.3
RUN apt-get update && apt-get install -y gcc git
ADD OctoPrint /OctoPrint
WORKDIR /OctoPrint
RUN python setup.py install
VOLUME /data
WORKDIR /data
EXPOSE 5000
CMD ["octoprint","--iknowwhatimdoing","--basedir","/data"]
