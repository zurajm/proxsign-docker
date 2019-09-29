FROM docker.io/library/ubuntu:18.04
RUN apt update
RUN apt install -y curl dpkg
RUN curl -o proxsign-2.1.4-1+9.1-amd64.deb https://www.si-trust.gov.si/assets/proxsign/druga-generacija/linux/v2.1.4.9.1/Ubuntu-18.04/proxsign-2.1.4-1+9.1-amd64.deb
RUN apt install -y ./proxsign-2.1.4-1+9.1-amd64.deb -y
RUN apt-get install -fy
RUN useradd -ms /bin/bash proxsign
RUN apt install -y net-tools socat firefox
ADD entrypoint.sh /entrypoint.sh
RUN chmod o+rwx /entrypoint.sh
EXPOSE 14972
VOLUME /home/proxsign
RUN chown proxsign /home/proxsign
USER proxsign
WORKDIR /home/proxsign
ENTRYPOINT /entrypoint.sh
