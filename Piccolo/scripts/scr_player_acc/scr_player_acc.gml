/// @description Calculates the players acceleration based on the state of the player.

	if(on_ground && (place_meeting(x, y-1, obj_solid) || place_meeting(x,y-sprite_height, obj_solid))){
		down = 1;
		down_held = 1;
		down_released = 0; 
		
		up = 0;
		up_held = 0;
		up_released = 0;
		
		direction_vertical = 1; 
	}

/// Horizontal Acceleration

	current_xacc = previous_xacc + (115200 * global.dt) * direction_horizontal;
	current_xacc = clamp(current_xacc, -2800, 2800);
		
	// Slow the player down if they stop giving input.
	if (direction_horizontal == 0) {
		if (sign(current_hspd) == 1) {
			current_xacc = -2800;

		} else if (sign(current_hspd) == -1) {
			current_xacc = 2800;
		} else {
			// current_hspd = 0
			current_xacc = 0;
		}
	}


// Block player from moving from outside the room.
	if (current_x < 50) {
		current_xacc = 0;
	} else if (current_x > (room_width - 50)) {
		current_xacc = 0;
	}
	if (current_x == 50) {
		current_xacc = max(0, current_xacc);
	} else if (current_x = (room_width - 50)) {
		current_xacc = min(0, current_xacc);
	}

/// Vertical Acceleration

	current_yacc = previous_yacc + (115200 * global.dt) * direction_vertical;
	current_yacc = clamp(current_yacc, -2800, 2800);
		
	// Slow the player down if they stop giving input.
	if (direction_vertical == 0) {
		if (sign(current_vspd) == 1) {
			current_yacc = -2800;

		} else if (sign(current_vspd) == -1) {
			current_yacc = 2800;
		} else {
			// current_vspd = 0
			current_yacc = 0;
		}
	}

// Block player from moving from outside the room.
	if (current_y < 20) {
		current_yacc = 0;
	} else if (current_y > (room_height - 20)) {
		current_yacc = 0;
	}
	if (current_y == 20) {
		current_yacc = max(0, current_yacc);
	} else if (current_y = (room_height - 20)) {
		current_yacc = min(0, current_yacc);
	}
