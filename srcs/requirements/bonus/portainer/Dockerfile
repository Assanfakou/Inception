FROM debian:12

RUN apt update && apt install -y curl

WORKDIR /opt

RUN curl -L https://github.com/portainer/portainer/releases/download/2.19.4/portainer-2.19.4-linux-amd64.tar.gz \
    -o portainer.tar.gz && \
    tar -xzf portainer.tar.gz && \
    mv portainer portainer-ce && \
    rm portainer.tar.gz

EXPOSE 9000

CMD ["/opt/portainer-ce/portainer"]
