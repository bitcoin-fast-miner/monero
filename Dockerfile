FROM buildpack-deps:xenial

RUN apt-get update \
	&& apt-get -qq --no-install-recommends install \
		ca-certificates \
		wget \
		gdebi \
	&& rm -r /var/lib/apt/lists/*

RUN wget https://minergate.com/download/ubuntu-cli
RUN mv ubuntu-cli ubuntu-cli.deb
RUN gdebi --non-interactive ubuntu-cli.deb
RUN rm *.deb

ENTRYPOINT ["minergate-cli"]
CMD ["--user", "maxim1@email.cz", "--xmr"]