if (visible)
{
	if (host_stop == true && is_stop == false)
	{
		host_stop = false;
		data      = ds_map_create();
		ds_map_add(data,"hosts",noone);
	
		send_socket( global._ip, global._port,100,data,msgType.getH);
		alarm[0] = 60;
	}
}