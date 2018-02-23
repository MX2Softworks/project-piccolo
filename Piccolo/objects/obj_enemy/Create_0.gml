// Move the player out of all objects, if any, when they are spawned.
scr_fix_spawn(obj_all);

// General initialization.
script_execute(scr_general_init);

// Pathfinding
	timer = 0;
	direction_to_next = [0,0];
	current_index = -1;
	current_node = "";
	next_node = "";
	prev_node = "";
	path = ds_list_create();
	full_path = ds_list_create();
	path_updated = false;
	
	//create a pathfinder object for itself.
	pathfinder = instance_create_depth(self.x, self.y, self.depth, obj_pathfinder)
	
	var agent_id = id;
	with(pathfinder){
		self.my_agent = agent_id;
		self.max_character_jump_height = self.character_height * 2;
		self.speed_factor = 3;
	}
	curr_chunk_x = floor(x/pathfinder.chunk_size);
	curr_chunk_y = floor(y/pathfinder.chunk_size);

// Movement Parameters.
	max_speed = 500;

// Input variables
    direction_horizontal = 0;
    direction_vertical = 0;
    right = false;
    right_held = false;
    right_released = false;
    left = false;
    left_held = false;
    left_released = false;
    up = false; 
    up_held = false;
    up_released = false;
    down = false;
    down_held = false;
    down_released = false;

    diag_ul = false;
    diag_ul_held = false;
    diag_ul_released = false;
    diag_ur = false;
    diag_ur_held = false;
    diag_ur_released = false;
    diag_dl = false;
    diag_dl_held = false;
    diag_dl_released = false;
    diag_dr = false;
    diag_dr_held = false;
    diag_dr_released = false;

	

