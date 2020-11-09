FROM ubuntu:18.04

RUN apt-get update

COPY install_dependencies.sh .
RUN bash install_dependencies.sh

COPY install_libnice.sh .
RUN bash install_libnice.sh

COPY install_libsrtp.sh .
RUN bash install_libsrtp.sh

COPY install_usrsctp.sh .
RUN bash install_usrsctp.sh

COPY install_libwebsockets.sh .
RUN bash install_libwebsockets.sh

COPY install_janus.sh .
RUN bash install_janus.sh

COPY setup_ssl.sh .
RUN bash setup_ssl.sh

EXPOSE 8088/tcp 8188/tcp 8188/udp
CMD ["/opt/janus/bin/janus"]
