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

RUN ln -s /usr/bin/nodejs /usr/bin/node
RUN npm install -g http-server

ADD entrypoint.sh .
RUN chmod +x entrypoint.sh
ADD index.html /usr/apps/hello-docker/index.html
WORKDIR /usr/apps/hello-docker/


EXPOSE 8080
ENTRYPOINT ["/entrypoint.sh"]


