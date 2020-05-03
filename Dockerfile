FROM fedora:32

LABEL Description="MiKTeX build environment, Fedora 32" Vendor="Christian Schenk" Version="2.9.7427"

RUN    dnf install -y \
           apr-devel \
           apr-util-devel \
           bison \
           bzip2-devel \
           cairo-devel \
           cmake \
           curl \
           curl-devel \
           flex \
           fribidi-devel \
           gcc \
           gcc-c++ \
	   git \
           gpg \
           gd-devel \
           gmp-devel \
           graphite2-devel \
           hunspell-devel \
           libicu-devel \
           libmspack-devel \
           libxslt \
           log4cxx-devel \
           make \
           mpfr-devel \
           openssl-devel \
           popt-devel \
           potrace-devel \
           qt5-devel \
           qt5-qtscript-devel \
           rpm-build \
           uriparser-devel \
           xz-devel \
           zziplib-devel

# libQt5Core.so.5 is build for Linux kernel 4.11 which is by far too new
# see: https://github.com/Microsoft/WSL/issues/3023
RUN strip --remove-section=.note.ABI-tag /usr/lib64/libQt5Core.so.5

RUN    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64" \
    && curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.10/gosu-amd64.asc" \
    && gpg --verify /usr/local/bin/gosu.asc \
    && rm /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu

RUN mkdir /miktex
WORKDIR /miktex

COPY scripts/*.sh /miktex/
COPY entrypoint.sh /miktex/

ENTRYPOINT ["/miktex/entrypoint.sh"]
CMD ["/miktex/make-package.sh"]
