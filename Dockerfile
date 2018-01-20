FROM buildpack-deps:xenial

RUN apt-get update \
	&& apt-get -qq --no-install-recommends install \
		ca-certificates \
		wget \
		gdebi \
	&& rm -r /var/lib/apt/lists/*

RUN wget https://download.minergate.com/deb-cli
RUN mv deb-cli deb-cli.deb
RUN gdebi --non-interactive deb-cli.deb
RUN rm *.deb

### Setup user for build execution and application runtime
ENV APP_ROOT=/opt/minergate-cli
ENV PATH=${APP_ROOT}:${PATH}
RUN chmod -R u+x ${APP_ROOT} && \
    chgrp -R 0 ${APP_ROOT} && \
    chmod -R g=u ${APP_ROOT} /etc/passwd

### Containers should NOT run as root as a good practice
USER 10001

ENTRYPOINT ["minergate-cli"]
CMD ["-user", "maxim1@email.cz", "-xmr"]