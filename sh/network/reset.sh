#!/bin/bash
#
# Resets state of an N node network.

#######################################
# Main entry point
# Arguments:
#   Network ordinal identifer.
#######################################
function main() {
    log "resetting network:"

    # Set args.
    idx=$1

    # Set paths.
    path=$NTCL/nets/net-$idx

    # TODO
}

# Import utils.
source $NTCL/sh/utils/shared.sh

# Invoke entry point.
main $1
