# Multi-stage build: Build for Linux 64-bit
FROM ubuntu:latest AS builder-amd64
RUN apt-get update && apt-get install -y wget tar && apt-get clean
RUN wget 'https://staticassets.meson.network/public/meson_cdn/v3.1.20/meson_cdn-linux-amd64.tar.gz' && \
    tar -zxf meson_cdn-linux-amd64.tar.gz && \
    rm -f meson_cdn-linux-amd64.tar.gz

# Final image for AMD64
FROM ubuntu:latest
ENV TOKEN=""
ENV HTTPS_PORT=443
ENV CACHE_SIZE=30

# Copy Meson CDN binaries from the AMD64 builder
COPY --from=builder-amd64 /meson_cdn-linux-amd64 /meson_cdn-linux-amd64

# Install Meson CDN and configure
RUN cd /meson_cdn-linux-amd64 && \
    ./service install meson_cdn && \
    ./meson_cdn config set --token=$TOKEN --https_port=$HTTPS_PORT --cache.size=$CACHE_SIZE

# Expose any necessary ports
EXPOSE $HTTPS_PORT

# Start Meson CDN service
CMD ["/meson_cdn-linux-amd64/service", "start", "meson_cdn"]