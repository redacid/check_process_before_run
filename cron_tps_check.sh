#!/bin/bash
export ORACLE_HOME=/usr/lib/oracle/11.2/client64
export LD_LIBRARY_PATH=$ORACLE_HOME/lib

cmd="$1"
id="$2"
now=`date +'%Y-%m-%d %H:%M:%S'`
logfile="/var/log/cron-tps.log"
scriptpath="/scripts/cron"
scriptname="cron_tps_run.sh"
mode='ENV_MODE_PROD'
randtimeout=`shuf -i 0-120 -n 1`

process=`ps ax | pgrep -f "$scriptname $id"`

#for i in ${process}; do
#  ps ax | grep $i
#done
#echo $process

if [ -z "$process" ];
then
        result=`$scriptpath/$scriptname $id $cmd $mode $randtimeout`
        #echo "$now [RES ] ${cmd} - $result"
        echo "$now [RES ] ${cmd} - $result" >> $logfile
else
        #echo "$now [WARN] ${cmd} - is already running"
        echo "$now [WARN] ${cmd} - is already running" >> $logfile
fi
