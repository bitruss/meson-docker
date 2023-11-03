#!/bin/bash

# Set Meson CDN configuration
/meson_cdn-linux-amd64/meson_cdn config set --token=$TOKEN --https_port=$HTTPS_PORT

# Start Meson CDN service
/meson_cdn-linux-amd64/meson_cdn meson_cdn