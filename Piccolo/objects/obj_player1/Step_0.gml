/// Executed each timestep.

// Move the player out of any walls, if they are stuck in them.
scr_fix_spawn(obj_solid);

// Get the keyboard or gamepad input.
scr_get_input();

// Check the player state based on input.
scr_player_state();

// Call the render script for the player.
script_execute(scr_render, obj_solid, scr_player_acc, scr_player_velo, scr_player_state, scr_player_anim);

if(keyboard_check_pressed(vk_f1)){
	fullscreen = !fullscreen;
	window_set_fullscreen(fullscreen);
}