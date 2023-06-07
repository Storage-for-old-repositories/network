if (check_new)
{
	check_new = false;
	alarm[0]  = 60;
	
	if (global.socket != undefined) 
	{
		data = ds_map_create();
		ds_map_add(data,"players",noone);
		ds_map_add(data,"hostnum",global.hostnum);
	
		send_socket( global._ip, global._port,200,data,msgType.newplayerH);
	}
}