if async_load[? "size"] > 0
{
	var buff = async_load[? "buffer"];
	buffer_seek(buff,buffer_seek_start,0);
	var response = buffer_read(buff,buffer_string);
	
	rJson = json_decode(response);
	
	if (ds_map_find_value(rJson,"type") == msgType.stopH)
	{
		var res    = ds_map_find_value(rJson,"res");
		
		if (res == "stop")
		{
			is_stop = true;
			room_goto(room_main);
		}
		if (res == "remove")
		{
			global.hostnum   = noone;
			global.playernum = noone;
			global.imnumber  = -1;
			
			room_goto(room_main);
			//is_stop = true;
			//room_goto(room_main);
		}
	}
}