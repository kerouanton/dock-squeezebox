# Container mounting a Guest CIFS remote folder.
# BK 09.2017
# Warning, run with cap-add to enable mount.
#
# Usage: docker run --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH -ti debian bash

FROM alpine:latest
RUN apk update && apk add cifs-utils
COPY ./smbcred /etc/smbcred
RUN mkdir /mnt/squeezebox
RUN echo "//qnap2/dskmusic/squeezebox   /mnt/squeezebox   cifs   _netdev,auto,credentials=/etc/smbcred   0   0" >> /etc/fstab
#RUN mount -a
CMD sleep infinity
