if async_load[? "size"] > 0
{
	var buff = async_load[? "buffer"];
	buffer_seek(buff,buffer_seek_start,0);
	var response = buffer_read(buff,buffer_string);
	
	rJson = json_decode(response);
	if (ds_map_find_value(rJson,"type") == msgType.create_enemy)
	{
		var res  = ds_map_find_value(rJson,"res");
		if (res == "create enemy")
		{

			//show_debug_message(string(ax))
		}
	}
	if (ds_map_find_value(rJson,"type") == msgType.getpH)
	{
		var pn  = ds_map_find_value(rJson,"playernum");
		var ps  = ds_map_find_value(rJson,"playerstat");
		show_debug_message(string(pn))
		
		if (pn == _PLAYER)
		{
			//
			massX = [];
			massY = [];
			if (ds_map_exists(rJson,"arrX"))
			{
				var ax = ds_map_find_value(rJson,"arrX");
				var ay = ds_map_find_value(rJson,"arrY");
				var size = ds_map_size(ax)
				for(var i = 0; i < size; i++)
				{
					if (ds_list_find_value(ax,i) != undefined )
					{
						massX[i] = ds_list_find_value(ax,i);
						massY[i] = ds_list_find_value(ay,i);
					}
				}
				show_debug_message(string([massX,massY]))
				for(i = 0; i < array_length(massX) ; i++)
				{
					instance_create_depth(massX[i],massY[i],0,o_enemy)
				}
			}
			//
			
			var __ext = true;
			try
			{
				x = ds_map_find_value(ps,"x");
			}
			catch(_ex)
			{
				__ext = false;
			}
			if (__ext)
			{
				_shoot = ds_map_find_value(ps,"_shoot");
				y = ds_map_find_value(ps,"y");
				image_angle = ds_map_find_value(ps,"_angle");
				hp     = ds_map_find_value(ps,"hp");
				_score = ds_map_find_value(ps,"_score");
			
				if (_shoot)
				{
					_shoot = false;
					var ins = instance_create_depth(x,y,0,o_bullet);
					ins.direction = image_angle;
					ins.speed = 15;
					ins._PLAYER = _PLAYER;
					ins.image_angle = image_angle;
					
					audio_play_sound(snd_shoot,0,0);
				}
			}
			else
			{
				instance_destroy();
			}
		}
	}
}