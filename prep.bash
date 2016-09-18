#!/bin/bash
FTP_USERNAME=${FTP_USERNAME:-kat}
FTP_PASSWORD=${FTP_PASSWORD:-kat}
FTP_USERID=${FTP_USERID:-1000}
useradd -u ${FTP_USERID} ${FTP_USERNAME}
echo “${FTP_USERNAME}:${FTP_PASSWORD}” | chpasswd
mkdir -p /data/ftp
chown -R ${FTP_USERNAME}:${FTP_USERNAME} /data/ftp
