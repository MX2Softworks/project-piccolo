my_agent = ""
selected = false;
debug_toggle = false;
timer = get_timer();

//assume default values if no agent claims the pathfinder
if(my_agent == ""){
	chunk_size = 64;
	character_height = floor( 64/ chunk_size);
}
else{
	
	//initialize values according to the agent's values. 
	// @debug: currently, we will use the same values. 
	chunk_size = 64;
	character_height = floor( my_agent.sprite_height/ chunk_size);
}

self.depth = 1;
scr_pathfinder_init(50, true);
