#!/bin/bash

# Set Meson CDN configuration

service install meson_cdn
meson_cdn config set --token=$TOKEN --https_port=$HTTPS_PORT 
service start meson_cdn