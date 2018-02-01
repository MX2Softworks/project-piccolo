/// @description Calculates the players acceleration based on the state of the player.

/// Horizontal Acceleration

	if (direction_horizontal != sign(current_hspd)) {
		current_xacc = 11200 * direction_horizontal;
	} else {
		current_xacc = 2800 * direction_horizontal;
	}
		
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


/// Vertical Acceleration

	if (direction_vertical != sign(current_vspd)) {
		current_yacc = 11200 * direction_vertical;
	} else {
		current_yacc = 2800 * direction_vertical;
	}
		
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

	if (current_x < 2) {
		current_xacc = 0;
	} else if (current_x > (room_width -sprite_width -2)) {
		current_xacc = 0;
	}
	if (current_x == 2) {
		current_xacc = max(0, current_xacc);
	} else if (current_x = (room_width -sprite_width -2)) {
		current_xacc = min(0, current_xacc);
	}
	
	if (current_y < 2) {
		current_yacc = 0;
	} else if (current_y > (room_height -sprite_height -2)) {
		current_yacc = 0;
	}
	if (current_y == 2) {
		current_yacc = max(0, current_yacc);
	} else if (current_y = (room_height -sprite_height -2)) {
		current_yacc = min(0, current_yacc);
	}
