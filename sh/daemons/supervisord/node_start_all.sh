#!/bin/bash
#
#######################################
# Spins up all nodes within a network.
# Globals:
#   NTCL - path to nctl home directory.
# Arguments:
#   Network ordinal identifer.
#   Node ordinal identifer.
#######################################

source $NTCL/sh/daemons/supervisord/utils.sh
source $NTCL/sh/daemons/supervisord/daemon_start.sh $1 
supervisorctl -c "$(get_path_net_supervisord_cfg $1)" start all  > /dev/null 2>&1
sleep 2.0
source $NTCL/sh/daemons/supervisord/node_status.sh $1 all
