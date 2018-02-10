/// Executed each timestep.

// Move the chaser out of any walls, if they are stuck in them.
scr_fix_spawn(obj_solid);

// Check the chaser state based on input.
scr_player_state();

// Call the render script for the chaser.
script_execute(scr_render, obj_solid, scr_player_acc, scr_player_velo, scr_player_state, scr_player_anim);