#!/bin/bash

# Set Meson CDN configuration
meson_cdn config set --token=$TOKEN --https_port=$HTTPS_PORT && \ meson_cdn start meson_cdn