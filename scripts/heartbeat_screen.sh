#!/bin/bash

# Really ugly hack to compensate for firmware in clock.
if perl -e 'exit ((localtime)[8])'; then
    # Winter time
    DST="-1 hour"
else
    # Summer time
    DST="0 hour"
fi

while true; do
    { while true; do 
    printf "%08x" $(date -d "$DST" "+%s") | sed 's/^\(..\)\(..\)\(..\)\(..\)$/PKT 00000000 1 0 \4 \3 \2 \1/'; echo; sleep 1; done } | nc localhost 1200
    EXIT_STATUS=$?
    sleep 1
done
