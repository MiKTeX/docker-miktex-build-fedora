FROM fedora:latest

LABEL Description="MiKTeX build environment, Fedora latest" Vendor="Christian Schenk" Version="2.9.6701"

RUN    dnf install -y \
           apr-devel \
           apr-util-devel \
           bison \
           bzip2-devel \
           cairo-devel \
           cmake \
           curl-devel \
           flex \
           fribidi-devel \
           gcc \
           gcc-c++ \
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

RUN mkdir /miktex
WORKDIR /miktex

COPY scripts/*.sh /miktex/
COPY entrypoint.sh /miktex/

#ENTRYPOINT ["/miktex/entrypoint.sh"]
CMD ["/miktex/make-package.sh"]
