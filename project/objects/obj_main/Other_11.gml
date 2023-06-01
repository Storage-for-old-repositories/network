
if (self.socket != undefined) {
	var _buffer = buffer_create(1024, buffer_grow, 1);
	buffer_write(_buffer, buffer_string, "hello");
	buffer_write(_buffer, buffer_string, "world");
	buffer_write(_buffer, buffer_u8, 251);
	buffer_write(_buffer, buffer_s8, -125);
	buffer_write(_buffer, buffer_u32, 4294967291);
	buffer_write(_buffer, buffer_s32, -2147483640);
	var _code = network_send_raw(self.socket, _buffer, buffer_tell(_buffer));
	buffer_delete(_buffer);
}
