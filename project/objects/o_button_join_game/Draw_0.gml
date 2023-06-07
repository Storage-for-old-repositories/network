//draw_self();

if (array_length(mass_host) > 0 )
{
	for (var i = 0; i < array_length(mass_host); i++) 
	{
		var str = string(mass_host[i])+"/"+" players:"+string(num_player[i]);
		draw_text(22,20 + (22*i),str)
		if (point_in_rectangle(mouse_x,mouse_y,22,20 + (22*i),222,20 + (22*i) + string_height(str)))
		{
			draw_rectangle(22,20 + (22*i),222,20 + (22*i) + string_height(str),1);
			if (mouse_check_button_pressed(mb_left))
			{
				_pn  = i;
				
				data = ds_map_create();
				ds_map_add(data,"hostnum",i);
				ds_map_add(data,"playernum",noone);
	
				send_socket( global._ip, global._port,100,data,msgType.joinH);
			}
		}
	}
}