if(my_agent != "")
{

	x = my_agent.x;
	y = my_agent.y;
}

//Toggles the ability to see the traversable regions. 
if (keyboard_check_pressed(ord("P"))) {
    debug_toggle = !debug_toggle;
}


//Regenerates the graph the chunk size changes. 
if(regen_graph){
	
	regen_graph = false;
	
	scr_pathfinder_init(search_limit, diagonal_valid);
}

//check the player's current location to see if we should restart our search or continue a previous one.
	
if(obj_player && (search_counter > 10 || search_counter == 0)){
	end_x = floor(obj_player.x/ chunk_size);
	end_y = floor(obj_player.y/ chunk_size); 
}	

//start a search if we press U or if a previous search from last frame is going. 
if(find_path || keyboard_check_pressed(ord("U")) || !((found && stopped) || (!found && !stopped) || search_counter > 10)){
	find_path = false;
	scr_pathfinder_find_path(floor(x/chunk_size), floor(y/chunk_size), end_x, end_y);
}

timer += get_timer();
