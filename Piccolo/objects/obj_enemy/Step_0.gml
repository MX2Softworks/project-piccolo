scr_fix_spawn(obj_solid);

prev_horizontal = direction_horizontal;

/* if(place_meeting(x,y, obj_death)){
	
	ds_list_clear(path);
	script_execute(scr_reset_room); 
} */


//calculate current chunk.
curr_chunk_x = round((x)/pathfinder.chunk_size);
curr_chunk_y = round((y)/pathfinder.chunk_size);

//if we finished a search, reset path.
if(timer > 1 && on_ground){
	timer = 0;
	ds_list_clear(pathfinder.closed_list);
	pathfinder.found = false;
	pathfinder.stopped = false;
	pathfinder.stop = false;
	current_node = ""; 
	current_index = ""; 
	prev_node = ""; 
	next_node = "";	
	ds_list_clear(path); 
	path_updated = true;
	pathfinder.find_path = true;
}

//set the path for the agent to follow.


//if we have a path,but no destination, set one.


//execute physics.
//script_execute(scr_render, obj_solid, scr_enemy_accel, scr_enemy_velo_mod, scr_enemy_state, "");	
	
timer += global.frame_time;

	
	
