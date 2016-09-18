# debian-based container for vsftpd
# VERSION               0.3
FROM debian:jessie
MAINTAINER Davide Lucchesi  "davide@lucchesi.nl"

RUN apt-get update -q -y \
    && apt-get install -q -y --no-install-recommends vsftpd \
    && apt-get clean

COPY prep.bash /root/prep.bash

RUN mkdir -p /var/run/vsftpd/empty \
    && echo "local_enable=YES" >> /etc/vsftpd.conf \
    && echo "chroot_local_user=YES" >> /etc/vsftp d.conf \
    && echo "write_enable=YES" >> /etc/vsftpd.conf \
    && echo "local_umask=022" >> /etc/vsftpd.conf \
    && echo "pasv_enable=Yes" >> /etc/vsftpd.conf \
    && echo "pasv_max_port=10100" >> /etc/vsftpd.conf \
    && echo "pasv_min_port=10090" >> /etc/vsftpd.conf \
    && echo "pasv_address=192.168.0.10" >> /etc/vsftpd.conf \
    && echo "local_root=/data" >> /etc/vsftpd.conf \
    && echo "chroot_local_user=YES" >> /etc/vsftpd.conf \
    && sed -i "s/anonymous_enable=YES/anonymous_enable=NO/" /etc/vsftpd.conf \
    && sed -i "s/listen=NO/listen=YES/" /etc/vsftpd.conf \
    && sed -i "s/listen_ipv6=YES/listen_ipv6=NO/" /etc/vsftpd.conf \
    && chmod +x /root/prep.bash
    


VOLUME /etc

EXPOSE 21

CMD /root/prep.bash
