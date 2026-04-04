#!/bin/sh
set -e

mkdir -p \
    "${TRANSMISSION_HOME}" \
    "${TRANSMISSION_DOWNLOAD_DIR}" \
    "${TRANSMISSION_INCOMPLETE_DIR}" \
    "${TRANSMISSION_WATCH_DIR}"

exec transmission-daemon \
    --foreground \
    --config-dir "${TRANSMISSION_HOME}" \
    --download-dir "${TRANSMISSION_DOWNLOAD_DIR}" \
    --incomplete-dir "${TRANSMISSION_INCOMPLETE_DIR}" \
    --watch-dir "${TRANSMISSION_WATCH_DIR}" \
    --port "${TRANSMISSION_RPC_PORT}" \
    --peerport "${TRANSMISSION_PEER_PORT}"