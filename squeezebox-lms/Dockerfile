FROM debian:latest

RUN apt-get update && apt-get -y wget

RUN wget -O lms.deb http://downloads-origin.slimdevices.com/nightly/7.9/sc/d424bbe/logitechmediaserver_7.9.1~1505480690_amd64.deb
RUN dpkg -i lms.deb
RUN rm lms.deb
RUN apt-get -y -f install
CMD ["service","logitechmediaserver","start"]

# TODO
#sudo apt-get install perl
#wget http://www.stereotool.com/download/stereo_tool_cmd_64
#wget http://www.stereotool.com/download/stereo_tool_cmd


