if async_load[? "size"] > 0
{
	var buff = async_load[? "buffer"];
	buffer_seek(buff,buffer_seek_start,0);
	var response = buffer_read(buff,buffer_string);
	
	rJson = json_decode(response);
	
	if (ds_map_find_value(rJson,"type") == msgType.createH)
	{
		var hostNumer    = ds_map_find_value(rJson,"hostnum");
		var playerNumber = ds_map_find_value(rJson,"playernum");	
		
		global.imnumber  = 0;
		global.hostnum   = hostNumer;
		global.playernum = playerNumber;
		
		room_goto(room_game)
		
	}
}