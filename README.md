# meson-docker



docker run -e TOKEN=tadiwrknuxvwhrizkvitdqfz -p 443:443 meson:amd-3.1.20 /meson_cdn-linux-amd64/meson_cdn

meson_cdn config set --token=tadiwrknuxvwhrizkvitdqfz --https_port=443



docker run -e TOKEN=tadiwrknuxvwhrizkvitdqfz -e HTTPS_PORT=443 -e CACHE_SIZE=30 -p 443:443 meson:amd64-3.1.20
