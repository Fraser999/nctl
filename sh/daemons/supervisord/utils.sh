function get_path_net_supervisord_config() {
	echo $NTCL/nets/net-$1/daemon/config/supervisord.conf
}

function get_path_net_supervisord_sock() {
	echo $NTCL/nets/net-$1/daemon/socket/supervisord.sock
}

function get_node_process_name() {
	echo "casper-net-$1-node-$2"
}