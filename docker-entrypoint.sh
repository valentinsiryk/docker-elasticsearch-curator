#!/bin/sh

echo "[OK] Service was started"

CURATOR_INTERVAL="${CURATOR_INTERVAL:-24h}"

while true; do
	echo "[INFO] Starting regular Elastic Curator job..."
	/usr/bin/curator --config /curator.yml $@ /action.yml || exit 1
	echo "[INFO] Next execution after $CURATOR_INTERVAL"
	sleep $CURATOR_INTERVAL
done
