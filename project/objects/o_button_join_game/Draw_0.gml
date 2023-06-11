draw_self();
draw_set_font(Font1);
if (array_length(mass_host) > 0 )
{
	for (var i = 0; i < array_length(mass_host); i++) 
	{
		draw_set_color(c_white);
		var str = "пинг у сервера: ?/"+" игроков:"+string(num_player[i]);
		draw_rectangle(22,20 + (66*i),string_width(str),20 + (66*i) + string_height(str),1);
		draw_text(22,20 + (66*i),str)
		if (point_in_rectangle(mouse_x,mouse_y,22,20 + (66*i),string_width(str),20 + (66*i) + string_height(str)))
		{
			draw_set_color(c_red);
			draw_rectangle(22,20 + (66*i),string_width(str),20 + (66*i) + string_height(str),1);
			if (mouse_check_button_pressed(mb_left))
			{
				with(o_button_join_auto)
				{
					instance_destroy();
				}
				_pn  = i;
				
				data = ds_map_create();
				ds_map_add(data,"hostnum",i);
				ds_map_add(data,"playernum",noone);
	
				send_socket( global._ip, global._port,100,data,msgType.joinH);
			}
		}
	}
}