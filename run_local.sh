#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Starting MySQL via docker-compose..."
docker-compose up -d db

echo "Starting Spring Boot app..."
./mvnw spring-boot:run
