#!/bin/bash
set -e

echo "Cloning repository..."
REPO_DIR="${HOME}/inventar"
rm -rf "$REPO_DIR"
git clone --recurse-submodules https://github.com/YukiYamazaki47/inventar.git "$REPO_DIR"
cd "$REPO_DIR"
git checkout aws

echo "Starting Docker containers..."
docker-compose up -d

echo ""
echo "Demo started successfully!"
echo "Backend available at http://localhost:8000"
echo ""
echo "Or from the network at:"
hostname -I | tr ' ' '\n' | grep -v '^$' | while read ip; do
  echo "   http://${ip}:8000"
done
