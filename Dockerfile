FROM fedora:39

LABEL Description="MiKTeX build environment, Fedora 39" Vendor="Christian Schenk" Version="23.12.29"

RUN \
    dnf install -y \
        apr-devel \
        apr-util-devel \
        bison \
        boost-devel \
        bzip2-devel \
        cairo-devel \
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
        qt6-linguist \
        qt6-qt5compat-devel \
        qt6-qtbase-devel \
        qt6-qtdeclarative-devel \
        qt6-qttools \
        qt6-qttools-static \
        rpm-build \
        uriparser-devel \
        xz-devel \
        zziplib-devel

RUN \
    curl -SL https://github.com/Kitware/CMake/releases/download/v3.28.1/cmake-3.28.1-linux-x86_64.tar.gz | tar -xz -C /usr/local --strip-components=1

RUN \
    export GNUPGHOME="$(mktemp -d)"; \
    gpg --batch --keyserver hkps://keys.openpgp.org --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4; \
    curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.14/gosu-amd64"; \
    curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.14/gosu-amd64.asc"; \
    gpg --batch --verify /usr/local/bin/gosu.asc; \
    rm /usr/local/bin/gosu.asc; \
    chmod +x /usr/local/bin/gosu

RUN mkdir /miktex
WORKDIR /miktex

COPY scripts/*.sh /miktex/
COPY entrypoint.sh /miktex/

ENTRYPOINT ["/miktex/entrypoint.sh"]
CMD ["/miktex/make-package.sh"]
