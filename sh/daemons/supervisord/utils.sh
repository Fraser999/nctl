#######################################
# Returns path to a network's supervisord.conf.
# Globals:
#   NTCL - path to nctl home directory.
# Arguments:
#   Network ordinal identifer.
#######################################
function get_path_net_supervisord_cfg() {
	echo $NTCL/nets/net-$1/daemon/config/supervisord.conf
}

#######################################
# Returns path to a network's socket file.
# Globals:
#   NTCL - path to nctl home directory.
# Arguments:
#   Network ordinal identifer.
#######################################
function get_path_net_supervisord_sock() {
	echo $NTCL/nets/net-$1/daemon/socket/supervisord.sock
}

#######################################
# Returns name of a node process managed via supervisord.
# Globals:
#   NTCL - path to nctl home directory.
# Arguments:
#   Network ordinal identifer.
#   Node ordinal identifer.
#######################################
function get_node_process_name() {
	echo "casper-net-$1-node-$2"
}
