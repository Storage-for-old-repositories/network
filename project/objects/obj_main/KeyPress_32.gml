

var _buffer = buffer_create(1024, buffer_grow, 1);
buffer_write(_buffer, buffer_text, "Hello");
network_send_raw(self.socket, _buffer, buffer_tell(_buffer));
buffer_delete(_buffer);
