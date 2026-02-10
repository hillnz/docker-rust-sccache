FROM curlimages/curl AS downloader

ARG TARGETPLATFORM

# renovate: datasource=github-releases depName=mozilla/sccache
ARG SCCACHE_VERSION=v0.14.0

COPY download-sccache.sh ./
RUN ./download-sccache.sh

FROM rust:1.93.0

COPY --from=downloader /tmp/sccache/sccache /usr/local/bin/sccache
