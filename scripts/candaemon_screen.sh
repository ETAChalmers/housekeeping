#!/bin/bash
AUML_DIR=$HOME/can/HomeAutomation
CAN_IP=192.168.41.51
CAN_PORT=1100

while true; do
    # Start candaemon
    $AUML_DIR/PcSoftware/scripts/canDaemon/canDaemon.pl -d udp -s $CAN_IP -p $CAN_PORT
    
    # If exit status of candaemon is OK, then exit. Else we just start candaemon again.
    EXIT_STATUS=$?
    [ $EXIT_STATUS -eq 0 ] && break
done
