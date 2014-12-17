stunnel-danted-docker
=====================

stunnel + danted docker 镜像

1. cd ~ && git clone https://github.com/wppurking/stunnel-danted-docker.git
2. docker run -it --privileged=true --net=host -v ~/stunnel-danted-docker/stunnel:/root/stunnel -v ~/stunnel-danted-docker/danted:/root/danted wppurking/stunnel-danted-docker
