FROM ubuntu:18.04
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
  aha=0.4.10.6-4 \
  curl=7.58.0-2ubuntu3.10 \
  docker-compose=1.17.1-2 \
  docker.io=19.03.6-0ubuntu1~18.04.1 \
  gcc=4:7.4.0-1ubuntu2.3 \
  git=1:2.17.1-1ubuntu0.7 \
  gnupg=2.2.4-1ubuntu1.3 \
  libc6-dev=2.27-3ubuntu1.2 \
  libcairo2=1.15.10-2ubuntu0.1 \
  libffi-dev=3.2.1-8 \
  libfontconfig1=2.12.6-0ubuntu2 \
  libgmp-dev=2:6.1.2+dfsg-2 \
  libgmp10=2:6.1.2+dfsg-2 \
  libjpeg62=1:6b2-3 \
  libpango-1.0=1.40.14-1ubuntu0.1 \
  libpangocairo-1.0=1.40.14-1ubuntu0.1 \
  libtinfo-dev=6.1-1ubuntu1.18.04 \
  locales=2.27-3ubuntu1.2 \
  make=4.1-9.1ubuntu1 \
  netbase=5.4 \
  python3-pip=9.0.1-2.3~ubuntu1.18.04.2 \
  python3-setuptools=39.0.1-2 \
  silversearcher-ag=2.1.0-1 \
  software-properties-common=0.96.24.32.14 \
  xz-utils=5.2.2-1.3 \
  zlib1g-dev=1:1.2.11.dfsg-0ubuntu2 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Thanks for the hint. Not sure why language-javascript built fine before this.
# https://github.com/tianon/docker-brew-debian/issues/45#issuecomment-325235517
RUN echo "LC_ALL=en_US.UTF-8" >> /etc/environment
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
RUN echo "LANG=en_US.UTF-8" > /etc/locale.conf
RUN locale-gen en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# stack
RUN curl -sSL https://get.haskellstack.org/ | sh

ARG RESOLVER=lts-16.12
RUN stack --resolver $RESOLVER setup
COPY packages.txt ./packages.txt
COPY sbin/build-all.sh  sbin/build-all.sh
RUN sbin/build-all.sh $RESOLVER packages.txt
RUN rm packages.txt
