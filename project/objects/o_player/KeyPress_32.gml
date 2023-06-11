if (global.socket != undefined) 
{
	var ii = 0;
	repeat(5)
	{
		ex[ii] = random_range(22,500);
		ey[ii] = random_range(22,500);
		ii++;
	}
	data = ds_map_create();
	ds_map_add(data,"arrX",ex);
	ds_map_add(data,"arrY",ey);
	
	send_socket( global._ip, global._port,200,data,msgType.statH);
}