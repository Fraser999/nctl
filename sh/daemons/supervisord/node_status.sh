#!/bin/bash
#
#######################################
# Displays node(s) status.
# Globals:
#   NTCL - path to nctl home directory.
# Arguments:
#   Network ordinal identifer.
#   Node ordinal identifer.
#######################################

source $NTCL/sh/daemons/supervisord/utils.sh
source $NTCL/sh/daemons/supervisord/daemon_start.sh $1 
if [ $2 = "all" ]; then
    supervisorctl -c "$(get_path_net_supervisord_cfg $1)" status all
else
    supervisorctl -c "$(get_path_net_supervisord_cfg $1)" status "$(get_node_process_name $1 $2)"
fi
