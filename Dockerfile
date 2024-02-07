FROM curlimages/curl AS downloader

ARG TARGETPLATFORM

# renovate: datasource=github-releases depName=mozilla/sccache
ARG SCCACHE_VERSION=v0.7.7

COPY download-sccache.sh ./
RUN ./download-sccache.sh

FROM rust:1.75.0

COPY --from=downloader /tmp/sccache/sccache /usr/local/bin/sccache
