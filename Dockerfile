FROM debian:bullseye
LABEL maintainer="janwiebe@janwiebe.eu"

RUN export DEBIAN_FRONTEND=noninteractive \
	&& apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		wget \
		screen \
		openjdk-17-jdk \
		nano \
		htop \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	;

WORKDIR /root/
ENTRYPOINT /root/minecraft/startmc.sh
