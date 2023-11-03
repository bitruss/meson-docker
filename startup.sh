#!/bin/bash

# Set Meson CDN configuration
meson_cdn config set --token=$TOKEN --https_port=$HTTPS_PORT && \ service start meson_cdn