#!/bin/bash
export HOUSEKEEPING=$HOME/can/housekeeping

# Kill existing screens
screen -S can_heartbeat -X quit
screen -S can_daemon -X quit

# Start screens
screen -S can_daemon -d -m /bin/bash "$HOUSEKEEPING/scripts/candaemon_screen.sh"
screen -S can_heartbeat -d -m /bin/bash "$HOUSEKEEPING/scripts/heartbeat_screen.sh"
