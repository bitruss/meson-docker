# Multi-stage build: Build for Linux 64-bit
FROM ubuntu:latest AS builder-amd64
RUN apt-get update && apt-get install -y wget tar && apt-get clean
RUN wget 'https://staticassets.meson.network/public/meson_cdn/v3.1.20/meson_cdn-linux-amd64.tar.gz' && \
    tar -zxf meson_cdn-linux-amd64.tar.gz && \
    rm -f meson_cdn-linux-amd64.tar.gz && \
    cd ./meson_cdn-linux-amd64

# Final image for AMD64
FROM ubuntu:latest
EXPOSE 443

# Copy Meson CDN binaries from the AMD64 builder
COPY --from=builder-amd64 /meson_cdn-linux-amd64 /meson_cdn-linux-amd64

# Set environment variables
ENV TOKEN=your_token_value
ENV HTTPS_PORT=443
ENV CACHE_SIZE=30

# Configure Meson CDN and start the service
CMD ["/meson_cdn-linux-amd64/meson_cdn", "config", "set", "--token=$TOKEN", "--https_port=$HTTPS_PORT", "--cache.size=$CACHE_SIZE", "&&", "/meson_cdn-linux-amd64/service", "start", "meson_cdn"]