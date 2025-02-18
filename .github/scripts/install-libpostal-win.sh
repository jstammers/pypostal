#!/usr/bin/env bash
set -e -u -x
pacman -S autoconf automake curl git make libtool gcc mingw-w64-x86_64-gcc
THIS_DIR="$(pwd)"
DEPS_DIR="$THIS_DIR/deps"
LIBPOSTAL_GIT_TAG="ea8c106ce5d893ed3e742b068b1d8979d37cc9e3"

brew install -y \
    curl \
    autoconf \
    automake \
    libtool \
    python-devel \
    pkgconfig

mkdir -p "$DEPS_DIR"
git clone https://github.com/openvenues/libpostal
cd libpostal
git checkout "$LIBPOSTAL_GIT_TAG"

./bootstrap.sh
./configure \
    --datadir="$(pwd)/datadir" \
    --prefix="$DEPS_DIR" \
    --bindir="$DEPS_DIR"
    # --disable-data-download
make install
