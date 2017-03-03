#!/bin/bash
export ORACLE_HOME=/usr/lib/oracle/11.2/client64
export LD_LIBRARY_PATH=$ORACLE_HOME/lib

id="$1"
cmd="$2"
mode="$3"
randtimeout="$4"

/usr/bin/php -f /scripts/cron/index.php ${cmd} ${randtimeout} --mode=${mode}

sleep $randtimeout
