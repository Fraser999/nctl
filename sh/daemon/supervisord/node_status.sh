#!/bin/bash
#
#######################################
# Displays node(s) status.
# Globals:
#   NCTL - path to nctl home directory.
# Arguments:
#   Network ordinal identifer.
#######################################

# Import utils.
source $NCTL/sh/daemon/supervisord/utils.sh

# Ensure daemon is up.
source $NCTL/sh/daemon/supervisord/daemon_start.sh $1 

# Display nodeset state.
supervisorctl -c "$(get_path_net_supervisord_cfg $1)" status all
