#!/bin/bash
#
#######################################
# Displays a node's current status.
# Globals:
#   NTCL - path to nctl home directory.
# Arguments:
#   Network ordinal identifer.
#   Node ordinal identifer.
#######################################

source $NTCL/sh/daemons/supervisord/utils.sh
supervisorctl -c "$(get_path_net_supervisord_config $1)" status "$(get_node_process_name $1 $2)"
