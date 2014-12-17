stunnel-danted-docker
=====================

stunnel + danted docker 镜像

# 需要自定义配置文件:
1. cd ~ && git clone https://github.com/wppurking/stunnel-danted-docker.git
2. docker run -d --privileged=true --net=host -v ~/stunnel-danted-docker/stunnel:/root/stunnel -v ~/stunnel-danted-docker/danted:/root/danted wppurking/stunnel-danted-docker

# 无需自定义配置文件
docker run -d --privileged=true --net=host wppurking/stunnel-danted-docker
