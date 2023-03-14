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
ENV LD_LIBRARY_PATH=.
RUN chmod +x bedrock_server
CMD ./bedrock_server
