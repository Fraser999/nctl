#!/bin/bash

# Import utils.
source $NTCL/sh/utils/shared.sh

# Main entry point.
function main()
{
	pushd $STESTS_HOME
	pipenv run supervisorctl -c $NTCL/sh/daemons/supervisord.conf status all
	popd -1
}

# Invoke entry point.
main
