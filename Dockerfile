FROM debian:bullseye
LABEL maintainer="janwiebe@janwiebe.eu"

RUN export DEBIAN_FRONTEND=noninteractive \
	&& apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		wget \
		screen \
		nano \
		htop \
		iputils-ping \
		curl \
		grep \
		openssl \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	;
RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb -O libssl1.1.deb	
RUN dpkg -i libssl1.1.deb
COPY update_bedrock_server.py /bin/
WORKDIR /home/minecraft
ENV LD_LIBRARY_PATH=.
CMD python3 update_bedrock_server.py && /bin/./bedrock_server
