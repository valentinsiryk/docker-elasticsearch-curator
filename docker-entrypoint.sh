#!/bin/sh
set -e

if [ -z "$CRON_SCHEDULE" ]; then
    CRON_SCHEDULE='5 * * * *'
    echo "[INFO] Variable CRON_SCHEDULE is not set. Will be used default."
fi

echo "$CRON_SCHEDULE     /usr/bin/curator --config /curator.yml /action.yml" >> /etc/crontabs/root
echo "[INFO] Was set CRON schedule '$CRON_SCHEDULE'"

exec "$@"
