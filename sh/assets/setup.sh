#!/bin/bash
#
# Sets assets required to run an N node network.
# Arguments:
#   Network ordinal identifer.
#   Count of nodes to setup.
#   Count of users to setup.

#######################################
# Sets assets pertaining to network binaries.
# Globals:
#   NCTL_CASPER_HOME - path to node software github repo.
# Arguments:
#   Path to network directory.
#######################################
function _set_bin() {
    log "... binaries"

    # Set directory.
    mkdir $1/bin

    # Set executables.
    cp $NCTL_CASPER_HOME/target/release/casper-client $1/bin
    cp $NCTL_CASPER_HOME/target/release/casper-node $1/bin

    # Set wasm.
    cp $NCTL_CASPER_HOME/target/wasm32-unknown-unknown/release/auction_install.wasm $1/bin
    cp $NCTL_CASPER_HOME/target/wasm32-unknown-unknown/release/mint_install.wasm $1/bin
    cp $NCTL_CASPER_HOME/target/wasm32-unknown-unknown/release/pos_install.wasm $1/bin
    cp $NCTL_CASPER_HOME/target/wasm32-unknown-unknown/release/standard_payment_install.wasm $1/bin
}

#######################################
# Sets assets pertaining to network chainspec.
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
    HIGHWAY_GENESIS_ERA_START_TIMESTAMP=$(python -c 'from time import time; print(int(round(time() * 1000)) + 10000)')

    # Set config.
    path_config=$1/chainspec/chainspec.toml
    cp $NCTL/templates/chainspec.toml $path_config
    sed -i "" "s/{GENESIS_NAME}/$GENESIS_NAME/g" $path_config
    sed -i "" "s/{GENESIS_TIMESTAMP}/$GENESIS_TIMESTAMP/g" $path_config
    sed -i "" "s/{HIGHWAY_GENESIS_ERA_START_TIMESTAMP}/$HIGHWAY_GENESIS_ERA_START_TIMESTAMP/g" $path_config

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
function _set_chainspec_account() {
    # TODO: update when key algo is removed from accounts.csv.
    pbk=`cat $2`
	cat >> $1/chainspec/accounts.csv <<- EOM
	${pbk:2},ed25519,$3,$4
	EOM
}

#######################################
# Sets assets pertaining to network daemon.
# Globals:
#   NCTL - path to nctl home directory.
# Arguments:
#   Path to network directory.
#   Nodeset count.
#   Network ordinal identifer.
#######################################
function _set_daemon() {
    log "... daemon"

    # Set directory.
    mkdir $1/daemon
    mkdir $1/daemon/config
    mkdir $1/daemon/logs
    mkdir $1/daemon/socket

    # Set daemon specific artefacts.
    if [ $NCTL_DAEMON_TYPE = "supervisord" ]; then
        source $NCTL/sh/daemon/supervisord/daemon_setup.sh $1 $2 $3
    fi
}

#######################################
# Sets assets pertaining to network faucet account.
# Arguments:
#   Path to network directory.
#######################################
function _set_faucet() {
    log "... faucet"

    # Set directory.
    mkdir $1/faucet

    # Set keys.
    $1/bin/casper-client keygen -f $1/faucet > /dev/null 2>&1

    # Set chainspec account.
    _set_chainspec_account \
        $1 \
        $1/faucet/public_key_hex \
        100000000000000000 \
        0
}

#######################################
# Sets assets pertaining to all nodes within network.
# Arguments:
#   Path to network directory.
#   Count of nodes to setup.
#   Network ordinal identifer.
#######################################
function _set_nodes() {
    log "... nodes"

    mkdir $1/nodes
    for node_id in $(seq 1 $2)
    do
        _set_node $1 $node_id $3
    done
}

#######################################
# Sets assets pertaining to a single node.
# Arguments:
#   Path to network directory.
#   Node ordinal identifer.
#   Network ordinal identifer.
#######################################
function _set_node () 
{
    # Set directory.
    mkdir $1/nodes/node-$2
    mkdir $1/nodes/node-$2/config
    mkdir $1/nodes/node-$2/keys
    mkdir $1/nodes/node-$2/logs
    mkdir $1/nodes/node-$2/storage

    # Set keys.
    $1/bin/casper-client keygen -f $1/nodes/node-$2/keys > /dev/null 2>&1

    # Set config params.
    HTTP_SERVER_BIND_PORT=$((50000 + ($3 * 100) + $node_id))
    NETWORK_BIND_PORT=0
    if [ $2 = "1" ]; then
        NETWORK_BIND_PORT=34553
        NETWORK_KNOWN_ADDRESS="# known_address = not-applicable am root node"
    else
        NETWORK_BIND_PORT=0
        NETWORK_KNOWN_ADDRESS="known_address = '127.0.0.1:34553'"
    fi

    # Set config.
    path_config=$1/nodes/node-$2/config/node-config.toml
    cp $NCTL/templates/node-config.toml $path_config
    sed -i "" "s/{NETWORK_BIND_PORT}/$NETWORK_BIND_PORT/g" $path_config
    sed -i "" "s/{NETWORK_KNOWN_ADDRESS}/$NETWORK_KNOWN_ADDRESS/g" $path_config
    sed -i "" "s/{HTTP_SERVER_BIND_PORT}/$HTTP_SERVER_BIND_PORT/g" $path_config

    # Set chainspec account.
    _set_chainspec_account \
        $1 \
        $1/nodes/node-$2/keys/public_key_hex \
        100000000000000000 \
        $((100000000000000 * $2))
}

#######################################
# Sets assets pertaining to all users within network.
# Arguments:
#   Path to network directory.
#   Count of users to setup.
#######################################
function _set_users() {
    log "... users"

    mkdir $1/users
    for user_idx in $(seq 1 $2)
    do
        _set_user $1 $user_idx
    done    
}

#######################################
# Sets assets pertaining to a single user.
# Arguments:
#   Path to network directory.
#   Path to user directory.
#######################################
function _set_user() {
    $1/bin/casper-client keygen -f $1/users/user-$2 > /dev/null 2>&1
}

#######################################
# Sets assets pertaining to network variables.
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

#######################################
# CLI entry point
# Arguments:
#   Network ordinal identifer.
#   Count of nodes to setup.
#   Count of users to setup.
#######################################

#######################################
# Destructure input args.
#######################################
for ARGUMENT in "$@"
do
    KEY=$(echo $ARGUMENT | cut -f1 -d=)
    VALUE=$(echo $ARGUMENT | cut -f2 -d=)   
    case "$KEY" in
        net) net=${VALUE} ;;
        nodes) nodes=${VALUE} ;;
        users) users=${VALUE} ;;
        *)   
    esac    
done

#######################################
# Main
#######################################

# Import utils.
source $NCTL/sh/utils/misc.sh

# Set directory.
net_path=$NCTL/assets/net-$net
if [ -d $net_path ]; then
    rm -rf $net_path
fi
mkdir -p $net_path

# Set artefacts.
log "setting network artefacts:"
_set_bin $net_path
_set_chainspec $net_path $net
_set_daemon $net_path $nodes $net
_set_faucet $net_path
_set_nodes $net_path $nodes $net
_set_users $net_path $users
_set_vars $net_path $net $nodes $users

log "network #$net assets have been setup."
