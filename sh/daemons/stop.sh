#!/bin/bash

# Import utils.
source $NTCL/sh/utils/misc.sh

# Main entry point.
function main()
{
	log "daemons :: stop supervisord "$1

	supervisorctl -c $NTCL/nets/net-$1/daemon/config/supervisord.conf stop all &>/dev/null 
	supervisorctl -c $NTCL/nets/net-$1/daemon/config/supervisord.conf shutdown &>/dev/null
}

# Destructure input args.
while getopts n: flag
do
    case "${flag}" in
        n) network=${OPTARG};;
    esac
done

# Invoke entry point.
main $network
