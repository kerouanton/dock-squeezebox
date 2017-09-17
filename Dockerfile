# Container mounting a Guest CIFS remote folder.
# BK 09.2017
# Warning, run with cap-add to enable mount.
#
# Usage: docker run --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH -ti debian bash

FROM alpine:latest

ENV CIFS_DIR //qnap2/dskmusic/squeezebox
ENV DATA_DIR /mnt/squeezebox

RUN apk update && apk add cifs-utils
COPY smbcred /etc/smbcred
RUN mkdir ${DATA_DIR}
RUN echo "${CIFS_DIR}  ${DATA_DIR}  cifs   \
    _netdev,credentials=/etc/smbcred   0   0" > /etc/fstab

RUN echo "echo bk_mount_start" > /tmp/run.sh
RUN echo "mount -a" >> /tmp/run.sh
RUN echo "echo bk_mount_ok" >> /tmp/run.sh
RUN echo "echo bk_tail_wait" >> /tmp/run.sh
RUN echo "tail -f /dev/null" >> /tmp/run.sh
RUN chmod 755 /tmp/run.sh
CMD ["/tmp/run.sh"]

#VOLUME ${DATA_DIR}
