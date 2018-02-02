// Draw the delta value to the screen.

draw_set_color(c_red);

draw_text(10, 144, string_hash_to_newline("delta_time: "+string_format(delta_time, 2, 2)));
draw_text(10, 168, string_hash_to_newline("room_speed: "+string_format(room_speed, 3, 0))); 

draw_text(10, 208, string_hash_to_newline("hspd: "+string_format(obj_player.current_hspd, 4, 2))); 
draw_text(10, 228, string_hash_to_newline("vspd: "+string_format(obj_player.current_vspd, 4, 2))); 
draw_text(10, 248, string_hash_to_newline("tspd: "+string_format(obj_player.total_spd, 4, 2))); 