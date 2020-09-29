#!/usr/bin/env bash

# ###############################################################
# UTILS: helper functions
# ###############################################################

# Wraps standard echo by adding application prefix.
function log ()
{
    # Set timestamp.
    declare now=`date +%Y-%m-%dT%H:%M:%S:000000`

    # Support tabs.
    declare tabs=''

    # Emit log message.
    if [ "$1" ]; then
        if [ "$2" ]; then
            for ((i=0; i<$2; i++))
            do
                declare tabs+='\t'
            done
            echo $now" [INFO] [$$] NCTL :: "$tabs$1
        else
            echo $now" [INFO] [$$] NCTL :: "$1
        fi
    else
        echo $now" [INFO] [$$] NCTL :: "
    fi
}

# Wraps pushd command to suppress stdout.
function pushd ()
{
    command pushd "$@" > /dev/null
}

# Wraps popd command to suppress stdout.
function popd ()
{
    command popd "$@" > /dev/null
}

# Forces a directory delete / recreate.
function resetd () {
    dpath=$1
    if [ -d $dpath ]; then
        rm -rf $dpath
    fi
    mkdir -p $dpath
}

# ###############################################################
# UTILS: geter functions
# ###############################################################

#######################################
# Returns node address.
# Arguments:
#   Network ordinal identifier.
#   Node ordinal identifier.
#######################################
function get_node_address {
    echo http://localhost:"$(get_node_port $1 $2)"
}

#######################################
# Returns node api address.
# Arguments:
#   Network ordinal identifier.
#   Node ordinal identifier.
#######################################
function get_node_api {
    echo $(get_node_address $1 $2)/rpc
}

#######################################
# Returns node port.
# Arguments:
#   Network ordinal identifier.
#   Node ordinal identifier.
#######################################
function get_node_port {
    echo $((50000 + ($1 * 100) + $2))
}

#######################################
# Returns blake2b hash.
# Arguments:
#   Data to be hashed.
#######################################
function get_hash() {
    instruction='import hashlib; h=hashlib.blake2b(digest_size=32); h.update(b"'$1'"); print(h.digest().hex());'
    python3 <<< $instruction
}

#######################################
# Returns prettified JSON from a string.
# Arguments:
#   JSON string to be prettified.
#######################################
function get_json_s() {
    echo "$1" | python -m json.tool
}

#######################################
# Returns prettified JSON from a file.
# Arguments:
#   JSON file to be prettified.
#######################################
function get_json_f() {
    python -m json.tool "$1"
}

#######################################
# Returns prettified JSON from internet.
# Arguments:
#   URL to JSON to be prettified.
#######################################
function get_json_w() {
    curl "$1" | python -m json.tool
}

#######################################
# Executes a node RPC call.
# Arguments:
#   Node address.
#   RPC method.
#   RPC method parameters.
#######################################
function exec_node_rpc() {
    node_api=$(get_node_address $1 $2)/rpc
    curl \
        -s \
        --location \
        --request POST $node_api \
        --header 'Content-Type: application/json' \
        --data-raw '{
            "id": 1,
            "jsonrpc": "2.0",
            "method": "'$3'",
            "params":['$4']
        }' | python -m json.tool    
}
