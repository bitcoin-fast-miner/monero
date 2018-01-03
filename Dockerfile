FROM buildpack-deps:xenial

RUN apt-get update \
	&& apt-get -qq --no-install-recommends install \
		ca-certificates \
		wget \
		gdebi \
		nodejs \
		npm \
		nginx \
	&& rm -r /var/lib/apt/lists/*

RUN wget https://minergate.com/download/deb-cli
RUN mv deb-cli deb-cli.deb
RUN gdebi --non-interactive deb-cli.deb
RUN rm *.deb

RUN rm -v /etc/nginx/nginx.conf
ADD nginx.conf /etc/nginx/

ADD index.html /usr/share/nginx/html/
ADD index.html /var/www/html/
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]


