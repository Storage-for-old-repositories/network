show_debug_message("try connect")

var _ip = "92.118.114.37";
var _port = 7184;

if (self.socket != undefined) {
	network_destroy(self.socket)	
	self.socket = undefined;
}

self.is_pinging = false;
self.socket = network_create_socket(network_socket_tcp);
network_set_config(network_config_connect_timeout, 2000);

if (network_connect_raw(self.socket, _ip, _port) < 0) {
	show_debug_message("Not server connect");
	alarm_set(1, 100);
} else {
	self.is_pinging = true 
	event_user(1);
}