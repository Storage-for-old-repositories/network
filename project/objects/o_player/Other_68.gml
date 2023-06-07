if async_load[? "size"] > 0
{
	var buff = async_load[? "buffer"];
	buffer_seek(buff,buffer_seek_start,0);
	var response = buffer_read(buff,buffer_string);
	
	rJson = json_decode(response);
	
	if (ds_map_find_value(rJson,"type") == msgType.getpH)
	{
		var pn  = ds_map_find_value(rJson,"playernum");
		var ps  = ds_map_find_value(rJson,"playerstat");
		//show_debug_message(string(pn))
		if (pn == _PLAYER)
		{
			show_debug_message("plus - "+string([_PLAYER,x,y]));
			x = ds_map_find_value(ps,"x");
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
			}
		}
	}
}