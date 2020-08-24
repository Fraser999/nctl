#!/bin/bash
#
# Sets artefacts required to run an N node network.

# Import utils.
source $NTCL/sh/utils/shared.sh

#######################################
# Main entry point
# Arguments:
#   Network ordinal identifer.
#   Count of nodes to setup.
#   Count of users to setup.
#######################################
function main() {
    log "setting network artefacts:"

    # Set args.
    idx=$1
    node_count=$2
    user_count=$3

    # Set paths.
    path=$NTCL/nets/net-$idx

    # Set directories.
	if [ -d $path ]; then
        rm -rf $path
	fi
    mkdir -p $path    

    # Set artefacts.
    _set_binaries $path
    _set_chainspec $path $idx
    _set_daemon $path
    _set_faucet $path
    _set_nodes $path $node_count
    _set_users $path $user_count
    _set_vars $path $idx $node_count $user_count
}

#######################################
# Sets artefacts pertaining to network binaries.
# Globals:
#   CASPER_HOME - path to node software github repo.
# Arguments:
#   Path to network directory.
#######################################
function _set_binaries() {
    log "... binaries"

    # Set directory.
    mkdir $1/bin

    # Set executables.
    cp $CASPER_HOME/target/release/casperlabs-client $1/bin
    cp $CASPER_HOME/target/release/casperlabs-node $1/bin

    # Set wasm.
    cp $CASPER_HOME/target/wasm32-unknown-unknown/release/mint_install.wasm $1/bin
    cp $CASPER_HOME/target/wasm32-unknown-unknown/release/pos_install.wasm $1/bin
    cp $CASPER_HOME/target/wasm32-unknown-unknown/release/standard_payment_install.wasm $1/bin
}

#######################################
# Sets artefacts pertaining to network chainspec.
# Arguments:
#   Path to network directory.
#   Network ordinal identifer.
#######################################
function _set_chainspec() {
    log "... chainspec"

    # Set directory.
    mkdir $1/chainspec

    # Set config params.
    GENESIS_NAME=casper-net-$2
    GENESIS_TIMESTAMP=$(python -c 'from time import time; print(int(round(time() * 1000)))')

    # Set config.
    path_config=$1/chainspec/chainspec.toml
    cp $NTCL/templates/chainspec.toml $path_config
    sed -i "" "s/{GENESIS_NAME}/$GENESIS_NAME/g" $path_config
    sed -i "" "s/{GENESIS_TIMESTAMP}/$GENESIS_TIMESTAMP/g" $path_config

    # Set accounts.csv.
    touch $1/chainspec/accounts.csv
}

#######################################
# Sets entry in chainspec's accounts.csv.
# Arguments:
#   Path to network directory.
#   Path to file containing an ed25519 public key in hex format.
#   Initial account balance (in motes).
#   Staking weight - validator's only.
#######################################
function set_chainspec_account() {
	cat >> $1/chainspec/accounts.csv <<- EOM
	`cat $2`,ed25519,$3,$4
	EOM
}

#######################################
# Sets artefacts pertaining to network daemon.
# Arguments:
#   Path to network directory.
#######################################
function _set_daemon() {
    log "... daemon"

    # Set directory.
    mkdir $1/daemon
    mkdir $1/daemon/config
    mkdir $1/daemon/logs
}

#######################################
# Sets artefacts pertaining to network faucet account.
# Arguments:
#   Path to network directory.
#######################################
function _set_faucet() {
    log "... faucet"

    # Set directory.
    mkdir $1/faucet

    # Set keys.
    $CASPER_CLIENT keygen -f $1/faucet > /dev/null 2>&1

    # Set chainspec account.
    set_chainspec_account \
        $1 \
        $1/faucet/public_key_hex \
        100000000000000000 \
        0
}

#######################################
# Sets artefacts pertaining to all nodes within network.
# Arguments:
#   Path to network directory.
#   Count of nodes to setup.
#######################################
function _set_nodes() {
    log "... nodes"

    mkdir $1/nodes
    for node_id in $(seq 1 $2)
    do
        _set_node $1 $node_id
    done
}

#######################################
# Sets artefacts pertaining to a single node.
# Arguments:
#   Path to network directory.
#   Node ordinal identifer.
#######################################
function _set_node () 
{
    # Set directory.
    mkdir $1/nodes/node-$2
    mkdir $1/nodes/node-$2/certs
    mkdir $1/nodes/node-$2/config
    mkdir $1/nodes/node-$2/keys
    mkdir $1/nodes/node-$2/logs
    mkdir $1/nodes/node-$2/storage

    # Set keys.
    $CASPER_CLIENT keygen -f $1/nodes/node-$2/keys > /dev/null 2>&1

    # Set certs.
    $CASPER_NODE generate-cert $1/nodes/node-$2/certs/tls

    # Set config params.
    VALIDATOR_NET_BIND_PORT=0
    VALIDATOR_NET_ROOT_ADDR_PORT=34553
    HTTP_SERVER_BIND_PORT=$((50000 + $node_id))

    # Set config.
    path_config=$1/nodes/node-$2/config/config.toml
    cp $NTCL/templates/node-config.toml $path_config
    sed -i "" "s/{VALIDATOR_NET_BIND_PORT}/$VALIDATOR_NET_BIND_PORT/g" $path_config
    sed -i "" "s/{VALIDATOR_NET_ROOT_ADDR_PORT}/$VALIDATOR_NET_ROOT_ADDR_PORT/g" $path_config
    sed -i "" "s/{HTTP_SERVER_BIND_PORT}/$HTTP_SERVER_BIND_PORT/g" $path_config

    # Set chainspec account.
    set_chainspec_account \
        $1 \
        $1/nodes/node-$2/keys/public_key_hex \
        100000000000000000 \
        $((100000000000000 * $2))
}

#######################################
# Sets artefacts pertaining to all users within network.
# Arguments:
#   Path to network directory.
#   Count of users to setup.
#######################################
function _set_users() {
    log "... users"

    mkdir $1/users
    for user_idx in $(seq 1 $2)
    do
        _set_user $1/users/user-$user_idx
    done    
}

#######################################
# Sets artefacts pertaining to a single user.
# Arguments:
#   Path to user directory.
#######################################
function _set_user() {
    $CASPER_CLIENT keygen -f $1 > /dev/null 2>&1
}

#######################################
# Sets artefacts pertaining to network variables.
# Arguments:
#   Path to network directory.
#   Network ordinal identifer.
#   Count of nodes to setup.
#   Count of users to setup.
#######################################
function _set_vars() {
    log "... variables"

    touch $1/vars
	cat >> $1/vars <<- EOM
# Network ordinal identifier.
IDX=$2

# Count of nodes to setup.
NODE_COUNT=$3

# Count of users to setup.
USER_COUNT=$4
	EOM
}

# Invoke entry point.
main $1 $2 $3
