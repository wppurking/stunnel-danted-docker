FROM ubuntu:trusty
MAINTAINER Wyatt Pan <wppurking@gmail.com>

RUN apt-get update && apt-get build-essential wget openssl libssl-dev dante-server -y

RUN cd /root && wget https://www.stunnel.org/versions.html && export stunnel_version=$(cat versions.html | cat versions.html | grep -o 'Version [0-9]\.[0-9][0-9]' | head -n 1 | grep -o [0-9]\.[0-9][0-9]) \
  && wget https://www.stunnel.org/downloads/stunnel-$stunnel_version.tar.gz && tar xvf stunnel-$stunnel_version.tar.gz \
  && cd stunnel-$stunnel_version && ./configure --sysconfdir=/etc && make && make install \
  && cd /root && rm -rf /root/versions.html && rm -rf stunnel-*

RUN cd /root/stunnel && openssl req -new -x509 -nodes -days 3650 -out stunnel.pem -keyout stunnel.pem -subj "/C=CN/ST=HuNan/L=Changsha/O=EasyAcc/OU=IT/CN=wyatt/emailAddress=wppurking@gmail.com"

ADD ./stunnel /root/stunnel
ADD ./danted /root/danted

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

CMD ["stunnel_danted_run"]

