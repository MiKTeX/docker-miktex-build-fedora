FROM fedora:25

LABEL Description="MiKTeX build environment, Fedora 25" Vendor="Christian Schenk" Version="2.9.6374"

RUN dnf install -y bison
RUN dnf install -y cmake
RUN dnf install -y flex
RUN dnf install -y gcc
RUN dnf install -y gcc-c++
RUN dnf install -y libxslt
RUN dnf install -y make
RUN dnf install -y rpm-build

RUN dnf install -y apr-devel
RUN dnf install -y apr-util-devel
RUN dnf install -y bzip2-devel
RUN dnf install -y cairo-devel
RUN dnf install -y curl-devel
RUN dnf install -y fribidi-devel
RUN dnf install -y gd-devel
RUN dnf install -y gmp-devel
RUN dnf install -y graphite2-devel
RUN dnf install -y hunspell-devel
RUN dnf install -y libicu-devel
RUN dnf install -y libmspack-devel
RUN dnf install -y log4cxx-devel
RUN dnf install -y mpfr-devel
RUN dnf install -y openssl-devel
RUN dnf install -y poppler-devel
RUN dnf install -y popt-devel
RUN dnf install -y potrace-devel
RUN dnf install -y uriparser-devel
RUN dnf install -y xz-devel
RUN dnf install -y zziplib-devel

RUN mkdir /miktex
ADD scripts/*.sh /miktex/

WORKDIR /miktex

CMD ["/miktex/make-package.sh"]
