#!/bin/bash
#
#######################################
# Reloads a node within a network.
# Globals:
#   NTCL - path to nctl home directory.
# Arguments:
#   Network ordinal identifer.
#   Node ordinal identifer.
#######################################

source $NTCL/sh/daemons/supervisord/node_stop.sh $1 $2
source $NTCL/sh/daemons/supervisord/node_start.sh $1 $2
