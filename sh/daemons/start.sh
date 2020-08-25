#!/bin/bash

# Import utils.
source $NTCL/sh/utils/misc.sh

# Main entry point.
function main()
{
	log "daemons :: start supervisord "$1

	# Reset logs.
	sh $NTCL/sh/daemons/reset_logs.sh -n $1

	# Launch daemon.
	supervisord -c $NTCL/nets/net-$1/daemon/config/supervisord.conf
	log "daemons :: start supervisord "$1
	
	# Wait for daemon to start and display status.
	sleep 3.0
	source $NTCL/sh/daemons/status.sh -n $1
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
