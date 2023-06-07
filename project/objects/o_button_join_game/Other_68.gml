if async_load[? "size"] > 0
{
	var buff = async_load[? "buffer"];
	buffer_seek(buff,buffer_seek_start,0);
	var response = buffer_read(buff,buffer_string);
	
	var rJson = json_decode(response);
	
	if (ds_map_find_value(rJson,"type") == msgType.joinH)
	{
		global.playernum    = ds_map_find_value(rJson,"playernum");
		global.hostnum      = _pn;
		global.imnumber     = num_player[_pn]
		//show_debug_message(string(hosts));
		room_goto(room_game);
	}
	
	if (ds_map_find_value(rJson,"type") == msgType.getH)
	{
		var hostsp    = ds_map_find_value(rJson,"hosts");
		
		mass_host  = [];
		num_player = [];
		var nhost  = ds_list_size(hostsp);
		
		for (var i = 0; i < nhost; i++) 
		{
			var host    = ds_list_find_value(hostsp, i)
			array_push(mass_host,host);
			
			if (host != undefined)
			{
				var players = ds_list_size(host)
			    //игроков
				array_push(num_player,players);
			}
			else
			{
				array_push(num_player,"?");
			}

		}
	}
}