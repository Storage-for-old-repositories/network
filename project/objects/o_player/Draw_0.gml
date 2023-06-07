//draw_sprite_ext(sprite_index,0,xx,yy,1,1,_angle,c_blue,1);
draw_self()

draw_text_color(x,y - 44,"PLAYER: " + string(_PLAYER + 1),c_black,c_black,c_black,c_black,1)
draw_text_color(x,y - 66,"HP: " + string(hp),c_black,c_black,c_black,c_black,1)
draw_text_color(x,y - 88,"SCORE: " + string(_score),c_black,c_black,c_black,c_black,1)