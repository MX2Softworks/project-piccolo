/// @description Sets input variables for the current step.

// FOR TESTING
if (keyboard_check(ord("R"))) {
		
	script_execute(scr_reset_room);
}

// Movement input.
right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"));
right_held = keyboard_check(vk_right) || keyboard_check(ord("D"));
right_released = keyboard_check_released(vk_right) || keyboard_check_released(ord("D"));
        
left = keyboard_check_pressed(vk_left)   || keyboard_check_pressed(ord("A"));
left_held = keyboard_check(vk_left)   || keyboard_check(ord("A")); 
left_released = keyboard_check_released(vk_left)   || keyboard_check_released(ord("A"));
        
up = keyboard_check_pressed(vk_up)     || keyboard_check_pressed(ord("W")); 
up_held = keyboard_check(vk_up)        || keyboard_check(ord("W")); 
up_released = keyboard_check_released(vk_up)     || keyboard_check_released(ord("W")); 
        
down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
down_held = keyboard_check(vk_down)    || keyboard_check(ord("S"));
down_released = keyboard_check_released(vk_down) || keyboard_check_released(ord("S"));
        
direction_vertical = max(down, down_held) - max(up, up_held); 
direction_horizontal = max(right, right_held) - max(left, left_held);

// Combat input.
stab = keyboard_check_pressed(ord("J"));