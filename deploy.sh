#!/bin/bash
set -euo pipefail
cd /srv/site
git pull --ff-only
sudo rsync -a --delete --exclude '.git' /srv/site/ /usr/share/caddy/
sudo restorecon -Rv /usr/share/caddy
echo "Deployed $(git rev-parse --short HEAD)"