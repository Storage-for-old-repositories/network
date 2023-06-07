show_debug_message("work")

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
}