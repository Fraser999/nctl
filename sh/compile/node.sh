#!/bin/bash
#
# Compiles node software.

# Import utils.
source $NTCL/sh/utils/misc.sh

#######################################
# Main entry point
# Globals:
#   CASPER_HOME - path to node software github repo.
#######################################
function main() {
    log "compiling node ..."

    pushd $CASPER_HOME
    make all
    popd -1
}

# Invoke entry point.
main
