#!/bin/bash

# Import utils.
source $NTCL/sh/utils/misc.sh

# Main entry point.
function main()
{
	pushd $STESTS_HOME
	pipenv run supervisorctl -c $NTCL/sh/daemons/supervisord.conf stop all &>/dev/null 
	pipenv run supervisorctl -c $NTCL/sh/daemons/supervisord.conf shutdown &>/dev/null
	popd -1
}

# Invoke entry point.
main
