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

if [ $# -eq 0 ]
  then
    tag='latest'
  else
    tag=$1
fi

docker build -t squeezebox-smb:$tag .
