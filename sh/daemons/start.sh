#!/bin/bash

# Import utils.
source $NTCL/sh/utils/misc.sh

# Main entry point.
function main()
{
	# Reset logs.
	source $NTCL/sh/daemons/reset_logs.sh

	# Launch daemon.
	pushd $STESTS_HOME
	pipenv run supervisord -c $NTCL/sh/daemons/supervisord.conf
	popd -1
	log "daemon :: launched supervisord"
	
	# Wait for daemon to start and display status.
	sleep 3.0
	source $NTCL/sh/daemons/status.sh
}

# Invoke entry point.
main
