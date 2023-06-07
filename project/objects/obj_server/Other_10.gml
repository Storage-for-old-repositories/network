show_debug_message("try connect")

global._ip   = "194.187.122.113";
global._port = 2080;

if (global.socket != undefined) 
{
	network_destroy(global.socket)	
	global.socket = undefined;
}

self.is_pinging = false;
global.socket = network_create_socket(network_socket_udp);
network_set_config(network_config_connect_timeout, 2000);

if (network_connect_raw(global.socket, global._ip, global._port) < 0) 
{
	show_debug_message("Not server connect");
	alarm_set(1, 100);
} 
else 
{
	self.is_pinging = true 
}