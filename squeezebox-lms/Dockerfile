FROM debian:latest

RUN apt-get update \
    && apt-get install -y wget

RUN wget -O lms.deb \
    http://downloads-origin.slimdevices.com/nightly/7.9/sc/d424bbe/logitechmediaserver_7.9.1~1505480690_amd64.deb
RUN apt-get -y -f install
RUN apt-get install -y perl
RUN dpkg -i lms.deb
RUN rm lms.deb
CMD ["service","logitechmediaserver","start"]

# TODO
#wget http://www.stereotool.com/download/stereo_tool_cmd_64
#wget http://www.stereotool.com/download/stereo_tool_cmd


