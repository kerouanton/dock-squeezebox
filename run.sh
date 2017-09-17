#docker run --cap-add SYS_ADMIN --cap-add DAC_READ_SEARCH -ti squeezebox-smb bash
docker run \
    --cap-add SYS_ADMIN \
    --cap-add DAC_READ_SEARCH \
    -ti \
    squeezebox-smb sh
