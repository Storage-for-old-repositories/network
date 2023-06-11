if (array_length(mass_host) > 0)
{
	_flag = 0;
	_pn   = 0;
	
	for (var i = 0; i < array_length(mass_host); i++) 
	{

		if (num_player[i] >= _flag)
		{
			_flag = num_player[i];
			_pn   = i;
		}
	}
				
	data = ds_map_create();
	ds_map_add(data,"hostnum",i);
	ds_map_add(data,"playernum",noone);
	
	send_socket( global._ip, global._port,100,data,msgType.joinH);
}
else
{
	if (global.socket != undefined) 
	{
		data = ds_map_create();
		ds_map_add(data,"hostnum",noone);
		ds_map_add(data,"playernum",noone);
	
		send_socket( global._ip, global._port,100,data,msgType.createH);
	}
	else
	{
		show_message_async("Нет активных игр")
	}
}