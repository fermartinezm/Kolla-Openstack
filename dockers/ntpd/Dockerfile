From alpine:3.10.1

MAINTAINER Fernando Martinez <fernando.martinezmeana@altran.com>

RUN apk update
RUN apk add --no-cache openntpd

ADD ntpd.conf /etc/ntpd.conf

EXPOSE 123/udp

ENTRYPOINT ["ntpd"]

CMD ["-d" ,"-f", "/etc/ntpd.conf", "-s"]
