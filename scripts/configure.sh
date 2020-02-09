#!/bin/sh
if [ ! -z "$1" ]; then
    package_revision=-DMIKTEX_PACKAGE_REVISION=$1
fi
cd /miktex/build
cmake \
    ${package_revision} \
    -DMIKTEX_LINUX_DIST=fedora \
    -DMIKTEX_LINUX_DIST_VERSION=28 \
    -DUSE_SYSTEM_HARFBUZZ=FALSE \
    -DUSE_SYSTEM_HARFBUZZ_ICU=FALSE \
    -DUSE_SYSTEM_POPPLER=FALSE \
    -DUSE_SYSTEM_POPPLER_QT5=FALSE \
    -DUSE_SYSTEM_LOG4CXX=FALSE \
    -DUSE_SYSTEM_URIPARSER=FALSE \
    -DWITH_UI_QT=TRUE \
    /miktex/source
