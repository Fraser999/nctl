#!/bin/bash
#
#######################################
# Tears doen a node within a network.
# Globals:
#   NTCL - path to nctl home directory.
# Arguments:
#   Network ordinal identifer.
#   Node ordinal identifer.
#######################################

source $NTCL/sh/daemons/supervisord/utils.sh

source $NTCL/sh/daemons/supervisord/daemon_start.sh $1 

sleep 3.0
supervisorctl -c "$(get_path_net_supervisord_config $1)" stop "$(get_node_process_name $1 $2)"  > /dev/null 2>&1

source $NTCL/sh/daemons/supervisord/node_status.sh $1 $2
