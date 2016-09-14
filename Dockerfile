FROM debian:8.5

MAINTAINER Anders Lindmark <anders.lindmark@gmail.com>

RUN apt-get update && apt-get install -y bzip2 libc6-i386 make curl && \
	curl -SL https://github.com/anderslindmark/d0013e/raw/master/provision/mips-sde.tar-06.61.bz2 | tar xjC / && \
	mkdir /code && \
	apt-get remove -y --purge curl $(apt-mark showauto) && apt-get autoremove -y --purge && rm -rf /var/lib/apt/lists/*

ENV PATH "/mips-sde/06.61/bin:$PATH"
WORKDIR /code
CMD make
