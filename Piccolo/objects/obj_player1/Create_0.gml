/// Initialize the chaser.
	
	//creates a framerate independent object.
	if(!instance_exists(obj_frame_rate_independence)) instance_create_depth(x, y, depth, obj_frame_rate_independence);


// Move the player out of all objects, if any, when they are spawned.
	scr_fix_spawn(obj_all);

// General initialization.
	script_execute(scr_general_init);

// Movement Parameters.
	max_speed = 450;
	
// Input variables.
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

// State variables.
	movement = true;
	attack = false;

// Attack variables.
	attack_start = false;
	attack_end = true;
    
// Temp.
	fullscreen = false;
	window_set_fullscreen(fullscreen);
	
// Reset.
	room_start_x = x;
	room_start_y = y;