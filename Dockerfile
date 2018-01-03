FROM buildpack-deps:xenial

RUN apt-get update \
	&& apt-get -qq --no-install-recommends install \
		ca-certificates \
		wget \
		gdebi \
		nodejs \
		npm \
	&& rm -r /var/lib/apt/lists/*

RUN wget https://minergate.com/download/deb-cli
RUN mv deb-cli deb-cli.deb
RUN gdebi --non-interactive deb-cli.deb
RUN rm *.deb

RUN npm cache clean -f
RUN npm install -g n
RUN n stable 
# setup working directory
# ADD /App /App
WORKDIR /App
RUN npm install 

EXPOSE 8080

ENTRYPOINT ["minergate-cli"]
CMD ["-user", "maxim1@email.cz", "-xmr"]