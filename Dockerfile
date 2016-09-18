# debian-based container for vsftpd
# VERSION               0.3
FROM debian:jessie
MAINTAINER Davide Lucchesi  "davide@lucchesi.nl"

RUN apt-get update -q -y \
    && apt-get install -q -y --no-install-recommends vsftpd \
    && apt-get clean

RUN mkdir -p /var/run/vsftpd/empty \
    && echo "local_enable=YES" >> /etc/vsftpd.conf \
    && echo "chroot_local_user=YES" >> /etc/vsftp d.conf \
    && echo "write_enable=YES" >> /etc/vsftpd.conf \
    && echo "local_umask=022" >> /etc/vsftpd.conf \
    && echo "pasv_enable=Yes" >> /etc/vsftpd.conf \
    && echo "pasv_max_port=10100" >> /etc/vsftpd.conf \
    && echo "pasv_min_port=10090" >> /etc/vsftpd.conf \
    && sed -i "s/anonymous_enable=YES/anonymous_enable=NO/" /etc/vsftpd.conf 

VOLUME /etc

EXPOSE 21

CMD /usr/sbin/vsftpd
