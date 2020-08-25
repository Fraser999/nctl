#!/bin/bash

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
	    	echo $now" [INFO] [$$] NTCL :: "$tabs$1
	    else
	    	echo $now" [INFO] [$$] NTCL :: "$1
	    fi
	else
	    echo $now" [INFO] [$$] NTCL :: "
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