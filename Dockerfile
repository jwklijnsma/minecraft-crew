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
		iputils-ping \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	;
WORKDIR /home/minecraft
#ENTRYPOINT /home/minecraft/startmc.sh
CMD /bin/ping localhost
