#!/bin/bash
set -e

echo "Pulling git repository with submodules..."
git pull --recurse-submodules
git submodule update --init --recursive

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
