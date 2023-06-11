show_debug_message("work")

global._ip   = "194.187.122.113";
global._port = 2080;

self.is_pinging  = true;
global.socket    = undefined;
global.hostnum   = noone;
global.playernum = noone;
global.imnumber  = -1;

event_user(0)
alarm_set(0, 30);

enum msgType
{
	createH,
	joinH,
	stopH,
	statH,
	getH,
	getpH,
	newplayerH,
	create_enemy,
}
