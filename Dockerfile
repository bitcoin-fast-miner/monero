FROM buildpack-deps:xenial

RUN apt-get update \
	&& apt-get -qq --no-install-recommends install \
		ca-certificates \
		wget \
		unzip \
	&& rm -r /var/lib/apt/lists/*

RUN wget https://minergate.com/download/xfast-ubuntu-cli -O ubuntu-cli.zip
RUN unzip ubuntu-cli.zip
RUN mv MinerGateX-cli-1.0-amd64/minergate-cli /usr/bin && rm ubuntu-cli.zip && rm -rf MinerGateX-cli-1.0-amd64

ENTRYPOINT ["minergate-cli"]
CMD ["-u", "maxim1@email.cz", "-xmr"]