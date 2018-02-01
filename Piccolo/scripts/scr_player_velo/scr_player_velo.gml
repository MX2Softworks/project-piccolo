/// @description Modifies the velocity after the verlet calculation.



/// Horizontal Speed
// Limit max speed.

	
	current_hspd = clamp(current_hspd, -1 * max_speed, max_speed);


// Do not allow horizontal speed when colliding with a wall.

	if (place_meeting(current_x-1, current_y, obj_solid)) {
		current_hspd = clamp(current_hspd, 0, max_speed);
	}
	if (place_meeting(current_x+1, current_y, obj_solid)) {
		current_hspd = clamp(current_hspd, -1 * max_speed, 0);
	}

// Input stopped and player stopped so set speed to 0.
	if (direction_horizontal == 0  && sign(previous_hspd) != sign(current_hspd)) {
		current_hspd = 0;
		current_xacc = 0;
		xrem = 0;
	}


// Block player from moving from outside the room.
	if (current_x < 2) {
		current_x = 2;
		current_hspd = 0;
	} else if (current_x > (room_width -sprite_width -2)) {
		current_x = room_width -sprite_width -2;
		current_hspd = 0;
	}
	if (current_x == 2) {
		current_hspd = max(0, current_hspd);
	} else if (current_x = (room_width - 2)) {
		current_hspd = min(0, current_hspd);
	}


// Limit max speed.
	current_vspd = clamp(current_vspd, -1 * max_speed, max_speed);

// Do not allow horizontal speed when colliding with a wall.

	if (place_meeting(current_x, current_y-1, obj_solid)) {
		current_vspd = clamp(current_vspd, 0, max_speed);
	}
	if (place_meeting(current_x, current_y+1, obj_solid)) {
		current_vspd = clamp(current_vspd, -1 * max_speed, 0);
	}

// Input stopped and player stopped so set speed to 0.
	if (direction_vertical == 0  && sign(previous_vspd) != sign(current_vspd)) {
		current_vspd = 0;
		current_yacc = 0;
		yrem = 0;
	}

// Block player from moving from outside the room.
	if (current_y < 2) {
		current_y =  2;
		current_vspd = 0;
	} else if (current_y > (room_height -sprite_height -2)) {
		current_y = room_height -sprite_height -20;
		current_vspd = 0;
	}
	if (current_y == 2) {
		current_vspd = max(0, current_vspd);
	} else if (current_y = (room_height - 2)) {
		current_vspd = min(0, current_vspd);
	}
