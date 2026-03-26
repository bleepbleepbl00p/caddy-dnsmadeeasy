#!/usr/bin/env bash
set -euo pipefail

# Deploy Caddy with DNS Made Easy module as a Docker container
# Usage: ./build-caddy-dme.sh

cd "$(dirname "$0")"

# Check for .env
if [[ ! -f .env ]]; then
    echo "No .env file found. Creating from .env.example..."
    cp .env.example .env
    echo "Edit .env with your DME credentials, then re-run."
    exit 1
fi

# Build and start
echo "==> Building Caddy image with DNS Made Easy module..."
docker compose build

echo "==> Starting container..."
docker compose up -d

echo "==> Running. Check logs with: docker compose logs -f"
docker compose ps
