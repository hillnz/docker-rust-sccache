#!/usr/bin/env sh

set -e

case "$TARGETPLATFORM" in
    "linux/arm64")
        platform=aarch64;;
    *)
        platform=x86_64;;
esac

mkdir /tmp/sccache
cd /tmp/sccache

curl --fail -L -o sccache.tar.gz \
    "https://github.com/mozilla/sccache/releases/download/${SCCACHE_VERSION}/sccache-${SCCACHE_VERSION}-${platform}-unknown-linux-musl.tar.gz"

tar xvf sccache.tar.gz --strip-components=1
chmod +x sccache
