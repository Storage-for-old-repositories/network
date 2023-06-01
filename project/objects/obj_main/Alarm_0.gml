alarm_set(0, 30);

if (self.is_pinging && self.socket != undefined) {
	var _buffer = buffer_create(1024, buffer_grow, 1);
	buffer_write(_buffer, buffer_text, "ping");
	var _code = network_send_raw(self.socket, _buffer, buffer_tell(_buffer));
	buffer_delete(_buffer);
	
	show_debug_message("ping " + string(_code))
	
	if (_code < 0) {
		event_user(0);	
	}
} else {
	show_debug_message("ping not cast");	
}
