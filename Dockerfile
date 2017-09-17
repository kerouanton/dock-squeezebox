# Container mounting a Guest CIFS remote folder.
# BK 09.2017
# Warning, run with cap-add to enable mount.
#
# Usage: docker run --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH -ti debian bash

FROM alpine:latest

ENV DATA_DIR /mnt/squeezebox

RUN apk update && apk add cifs-utils
COPY smbcred /etc/smbcred
RUN mkdir ${DATA_DIR}
RUN echo "//qnap2/dskmusic/squeezebox   /mnt/squeezebox   cifs   \
    _netdev,credentials=/etc/smbcred   0   0" > /etc/fstab
RUN echo "mount -a" > /tmp/run.sh
#RUN echo "sh" >> /tmp/run.sh
RUN echo "sleep infinity" >> /tmp/run.sh
#RUN chmod 755 /tmp/run.sh
#CMD [".","/tmp/run.sh"]
#CMD ["mount","-a"]
#CMD sleep infinity

VOLUME ${DATA_DIR}

