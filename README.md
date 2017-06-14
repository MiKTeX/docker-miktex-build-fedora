# Fedora 25 docker image with MiKTeX build environment

## Obtaining the image

Get the latest image from the registry:

    docker pull miktex/miktex-build-fedora-25

or build it yourself:

    docker build --tag miktex/miktex-build-fedora-25 .

## Using the image

### Prerequisites

MiKTeX source code must be mounted to the container path
`/miktex/source` and the build directory must be mounted to the
container path `/miktex/build`.

### Example

Build the MiKTeX RPM:

    mkdir -p ~/work/miktex/source
    mkdir -p ~/work/miktex/builds/fedora-25
    curl -fsSL https://miktex.org/download/ctan/systems/win32/miktex/source/miktex-2.9.tar.xz | \
      tar -xJ --strip-components=1 -C ~/work/miktex/source
    docker run -t \
      -v ~/work/miktex/source:/miktex/source:ro \
      -v ~/work/miktex/builds/fedora-25:/miktex/build:rw \
      miktex/miktex-build-fedora-25

The build artifact `miktex-*.rpm` will be written to
`~/work/miktex/builds/fedora-25`.
