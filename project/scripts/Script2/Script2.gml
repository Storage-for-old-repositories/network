#macro cam_x camera_get_view_x(view_camera[0]);
#macro cam_y camera_get_view_y(view_camera[0]);
#macro cam_w camera_get_view_width(view_camera[0]);
#macro cam_h camera_get_view_height(view_camera[0]);

function collision_line_distance(x, y, dir, len, obj)
{	
	if(collision_line(x, y, x+lengthdir_x(len, dir), y+lengthdir_y(len, dir), obj, true, false)){
		var dist = len;
		while(dist > 1)
		{
			dist/=2;
			var collision = collision_line(x, y, x+lengthdir_x(len, dir), y+lengthdir_y(len, dir), obj, true, false);
			if(collision)
			{
				len -= dist;
			}
			else
			{
				len += dist;
			}
		}
	}
	return len;
}

function scr_move()
{
	_cam_x = cam_x;
	_cam_y = cam_y;
	_cam_w = cam_w;
	_cam_h = cam_h;

	view_xview = _cam_x;
	view_yview = _cam_y;

	real_xview = x + 0.25*(mouse_x - x)/2-_cam_w/2  
	real_yview = y + 0.25*(mouse_y - y)/2-_cam_h/2

	if (_cam_x != real_xview) { view_xview += (real_xview - _cam_x)/2 }
	if (_cam_y != real_yview) { view_yview += (real_yview - _cam_y)/2 }

	if (view_xview < 0) { view_xview = 0 }
	if (view_yview < 0) { view_yview = 0 }

	if (view_yview > room_height-_cam_h) { view_yview = room_height-_cam_h }
	if (view_xview > room_width -_cam_w) { view_xview = room_width-_cam_w }

	camera_set_view_pos(view_camera[0],view_xview,view_yview);

	var pd = point_direction(x, y, mouse_x, mouse_y);
	//image_angle = scr_angle(image_angle,pd,10)

	var tx = sprite_get_xoffset(sprite_index);
	var ty = sprite_get_yoffset(sprite_index);
	if ( (x + tx) > room_width)
	{
		x = room_width - tx;
	}
	if ( (x - tx) <= 0)
	{
		x = tx;
	}

	if ( (y + ty) > room_height)
	{
		y = room_height - ty;
	}
	if ( (y - ty) <= 0)
	{
		y = ty;
	}
	
	movex = keyboard_check(ord("D")) - keyboard_check(ord("A"));
	movey = keyboard_check(ord("S")) - keyboard_check(ord("W"));
	
	if (abs(movex) > 0 or abs(movey) > 0 )
	{
		//if (!audio_is_playing(snd_step))
		//{
		//	audio_play_sound(snd_step,0,0);
		//}
	}

	movex = movex*2.5;
	movey = movey*2.5;

	dx+=(x-dx)*0.1;
	dy+=(y-dy)*0.1;

	dir = point_direction(0, 0, movex, movey);
	len = min(3.5, 3.5*point_distance(0, 0, movex, movey));

	x += lengthdir_x(len, dir);
	y += lengthdir_y(len, dir);

	var px=0, py=0;

	for(var dir=0; dir<360; dir+=18)
	{
		var len=collision_line_distance(x, y, dir, 20, o_solid);
		px+=lengthdir_x(len, dir);
		py+=lengthdir_y(len, dir);	
	}

	px/=5;
	py/=5;

	x+=px;
	y+=py;
}