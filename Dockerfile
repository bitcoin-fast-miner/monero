FROM ubuntu:latest

RUN apt-get update \
	&& apt-get -qq --no-install-recommends install \
		ca-certificates \
		wget \
		gdebi \
	&& rm -r /var/lib/apt/lists/*

RUN wget https://minergate.com/download/deb-cli
RUN mv deb-cli minergate-cli-release.deb
RUN gdebi minergate-cli-release.deb
RUN rm *.deb

ENTRYPOINT ["minergate-cli"]
CMD ["-user", "maxim1@email.cz", "-xmr"]