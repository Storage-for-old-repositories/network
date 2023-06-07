if (global.socket != undefined) 
{
	data = ds_map_create();
	ds_map_add(data,"hostnum",noone);
	ds_map_add(data,"playernum",noone);
	
	send_socket( global._ip, global._port,100,data,msgType.createH);
}