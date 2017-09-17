#!/usr/bin/env bash

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

docker run \
    --cap-add SYS_ADMIN \
    --cap-add DAC_READ_SEARCH \
    -ti \
   squeezebox-smb
