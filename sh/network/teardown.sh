#!/bin/bash
#
# Destroys artefacts previously created to run an N node network.

#######################################
# Main entry point
# Arguments:
#   Network ordinal identifer.
#######################################
function main() {
    log "tearing down network artefacts:"

    # Set args.
    idx=$1

    # Set paths.
    path=$NTCL/nets/net-$idx

    # Destroy directories.
    rm -rf $path
}

# Import utils.
source $NTCL/sh/utils/misc.sh

# Invoke entry point.
main $1
