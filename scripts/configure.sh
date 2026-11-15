#!/bin/sh
package_revision=${1-1}
cd /miktex/build
cmake \
    -DMIKTEX_PACKAGE_REVISION=${package_revision} \
    -DMIKTEX_LINUX_DIST=fedora \
    -DMIKTEX_LINUX_DIST_VERSION=44 \
    -DWITH_UI_QT=TRUE \
    /miktex/source
