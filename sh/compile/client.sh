#!/bin/bash
#
#######################################
# Compiles client software.
# Globals:
#   NCTL_CASPER_HOME - path to casper node repo.
#   NTCL - path to nctl home directory.
########################################

source $NTCL/sh/utils/misc.sh
pushd $NCTL_CASPER_HOME/client
cargo build
popd -1
