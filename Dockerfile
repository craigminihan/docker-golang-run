FROM ubuntu:16.04
LABEL maintainer="Jordi Íñigo"

ENV DEBIAN_FRONTEND=noninteractive TERM=linux VERSION=1.10.2 OS=linux ARCH=amd64

# Download general prerequisites
RUN apt-get -y update && apt-get -y install \
	bzip2 \
	git-core \
	net-tools \
	wget && \
	rm -rf /var/lib/apt/lists/*

# golang install
RUN wget http://golang.org/dl/go$VERSION.$OS-$ARCH.tar.gz -q -O - | tar -zxf - -C /usr/local

# golang env
ENV GOPATH=/go GOROOT=/usr/local/go PATH=$PATH:/usr/local/go/bin
VOLUME [ "/go" ]

CMD ["/bin/bash"]
