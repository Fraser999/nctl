#!/bin/bash
#
#######################################
# Compiles node software.
# Globals:
#   NCTL_CASPER_HOME - path to casper node repo.
#   NCTL - path to nctl home directory.
########################################

source $NCTL/sh/utils/misc.sh
pushd $NCTL_CASPER_HOME
export CARGO_FLAGS=--release
make all
popd -1
