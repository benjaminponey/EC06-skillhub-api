#!/usr/bin/env bash
set -euo pipefail
IMAGE_TAG="${1:-latest}"
TARGET_ENV="${2:-production}"
TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
LOG_FILE="deploy.log"
{
  echo "=== SkillHub API - deploiement simule ==="
  echo "Date (UTC)        : ${TIMESTAMP}"
  echo "Image taguee      : skillhub-api:${IMAGE_TAG}"
  echo "Environnement cible: ${TARGET_ENV}"
  echo ""
  echo "Statut : SUCCES (simulation)"
} | tee "${LOG_FILE}"
echo "Deploiement simule termine. Log ecrit dans ${LOG_FILE}."