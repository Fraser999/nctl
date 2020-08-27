#!/bin/bash
#
#######################################
# Spins up a node within a network.
# Globals:
#   NTCL - path to nctl home directory.
# Arguments:
#   Network ordinal identifer.
#   Node ordinal identifer.
#######################################

# Import utils.
source $NTCL/sh/daemons/supervisord/utils.sh

# Ensure daemon is alive.
source $NTCL/sh/daemons/supervisord/daemon_start.sh $1 

# Start node.
supervisorctl -c "$(get_path_net_supervisord_config $1)" start "$(get_node_process_name $1 $2)"  > /dev/null 2>&1

# Display node status.
sleep 2.0
source $NTCL/sh/daemons/supervisord/node_status.sh $1 $2
