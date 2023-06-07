if async_load[? "size"] > 0
{
	var buff = async_load[? "buffer"];
	buffer_seek(buff,buffer_seek_start,0);
	var response = buffer_read(buff,buffer_string);
	
	rJson = json_decode(response);

	if (ds_map_find_value(rJson,"type") == msgType.newplayerH)
	{
		var players  = ds_map_find_value(rJson,"players");
		//show_debug_message(string(players));
		//var all_player = instance_number(o_player);
		
		//if (all_player > 0)
		//{
		//	for(var i = 0; i < all_player; ++i)
		//	{
		//		var ext_player        = instance_find(o_player, i);
		//		var number_of_players = ds_list_size(players);
				
		//		for(var j = 0; j < number_of_players; j++)
		//		{
		//			show_debug_message("list players")
		//			var player = ds_list_find_value(players,j);
		//			var pn     = ds_map_find_value(player,"playernum");
					
		//			if (pn == ext_player._PLAYER)
		//			{
		//				show_debug_message("delete players")
		//				ds_list_delete(players, j);
		//				number_of_players = ds_list_size(players);
		//			}
		//		}
		//	}
		//}
		
		if (players != undefined)
		{
			var players_remain = ds_list_size(players);
		
			for(var i = 0; i < players_remain; ++i)
			{
				mass[i] = -1;
			}
		
			__num = 0;
		
			with(o_player)
			{
				if (global.imnumber != _PLAYER)
				{
					instance_destroy();
				}
				//other.mass[other.__num] = _PLAYER;
				//other.__num++;
			}
		
		
			show_debug_message("ALL PLAYERS: "+string(players_remain));
			for(var i = 0; i < players_remain; ++i)
			{
				//var player = ds_list_find_value(players, i); 
				var xx     =  ds_map_find_value(players, "x"); 
				var yy     =  ds_map_find_value(players, "y"); 
			
				//if (mass[i] == -1)
				{
					if (global.imnumber != i)
					{
						show_debug_message("CREATE NEW PLAYER")
						var newplayer = instance_create_depth(-66,-66,-100,o_player);
						newplayer.our_player = false;
						newplayer._PLAYER    =  i; 
					}
				}
			}
		}
		else
		{
			show_message_async("конец ссесии")
			room_goto(room_main);
		}
	}
}