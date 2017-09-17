# Logitech Squeezebox Service
#
# Author: BK
# Date: sept.2017

# squeezebox-smb :
#  Mounts a CIFS share to my NAS,
#  and provides it as a volume
#  to the other squeezebox docker containers.
#
# This docker needs to be run with extended
# capabilities since it mounts a CIFS filesystem.
# Usage: docker run --cap-add SYS_ADMIN
#                   --cap-add DAC_READ_SEARCH
#                    -ti squeezebox-vm

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
