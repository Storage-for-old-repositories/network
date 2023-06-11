// Ресурсы скриптов были изменены для версии 2.3.0, подробности см. по адресу
// https://help.yoyogames.com/hc/en-us/articles/360005277377
function send_socket(_ip,_port,_size,_map,_type){
	if (global.socket != undefined) 
	{
		ds_map_add(data,"type",_type);
		data_json = json_encode(_map)
		ds_map_destroy(_map);
	
		var _buffer = buffer_create(_size, buffer_grow, 1);
		buffer_seek(_buffer,buffer_seek_start,0);
		buffer_write(_buffer, buffer_text, data_json);
		var _code = network_send_udp_raw(global.socket, _ip, _port, _buffer, buffer_tell(_buffer));
		buffer_delete(_buffer);
	}
}

function scr_angle(_dir,_todir,_speed){
/*
Скрипт плавно изменяет направление башни до требуемого
Возвращает полученное направление
argument0 - текущее направление
argument1 - требуемое направление
argument2 - скорость изменения направления
Автор скрипта DreamRunner 09.09.2006
*/

_dir = _dir mod 360; // Ограничиваем направление - от -360 до 360 (не включительно).
if _dir <0 _dir += 360; // Если направление меньше 360 - преобразовываем значение в положительное
if abs(_dir-_todir)<_speed // Если разница между направлениями меньше скорости поворота, то...
    return _todir; // Возвращаем требуемое направление
return _dir + (sign(sin(degtorad(_todir-_dir)))*_speed);
}