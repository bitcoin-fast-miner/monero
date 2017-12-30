FROM ubuntu:latest

RUN apt-get update \
	&& apt-get -qq --no-install-recommends install \
		ca-certificates \
		wget \
		gdebi \
	&& rm -r /var/lib/apt/lists/*

RUN wget -q --content-disposition https://minergate.com/download/deb-cli \
	&& mv deb-cli minergate-cli-release.deb \
	&& gdebi minergate-cli-release.deb \
	&& rm *.deb

ENTRYPOINT ["minergate-cli"]
CMD ["-user", "maxim1@email.cz", "-xmr"]