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
		python3 \
		python3-pip \
		unzip \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	;
RUN python3 -m pip install requests
RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2_amd64.deb -O libssl1.1.deb	
RUN echo deb http://download.proxmox.com/debian/pbs-client bullseye main > /etc/apt/sources.list.d/pbs-client.list    
RUN curl https://enterprise.proxmox.com/debian/proxmox-release-bullseye.gpg --output /etc/apt/trusted.gpg.d/proxmox-release-bullseye.gpg
RUN apt-get update 
RUN apt-get -y install proxmox-backup-client
RUN dpkg -i libssl1.1.deb
COPY update_bedrock_server.py /bin/
WORKDIR /home/minecraft
ENV LD_LIBRARY_PATH=.
CMD python3 /bin/update_bedrock_server.py && ./bedrock_server

