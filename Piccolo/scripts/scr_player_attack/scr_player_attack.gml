/// Handles a player attack.

if (attack_end) {
	// Get rid of the sword object.
	if (instance_exists(obj_stab)) {
		instance_destroy(obj_stab);
	}
	attack_end = false;
	attack = false;
} else {
	if (!attack_start) {
		// Start attack.
		instance_create_layer(obj_player.x-64, obj_player.y+5, "Instances", obj_stab);
		attack_start = true;
		attacking = true;
	}

	if (attacking) {
		// Testing sword spawning.
		if (keyboard_check(ord("K"))) {
			attack_end = true;
			attacking = false;
			attack_start = false;
		}
	}
}