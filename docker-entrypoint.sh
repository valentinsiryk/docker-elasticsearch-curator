#!/bin/sh

echo "Service was started"

CURATOR_INTERVAL="${CURATOR_INTERVAL:-24h}"

while true; do
	echo "Starting regular Elasticsearch Curator job..."
	/usr/bin/curator --config /curator.yml $@ /action.yml || exit 1
	echo "Next execution after $CURATOR_INTERVAL"
	sleep $CURATOR_INTERVAL
done
