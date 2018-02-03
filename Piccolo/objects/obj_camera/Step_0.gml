//set xTo as whatever entity we are following.
if (follow != noone)
{
	xTo = follow.x
	yTo = follow.y
}

//do a linear interpolation to create smooth panning.
x += (xTo - x)/interpolation_rate;
y += (yTo - y)/interpolation_rate;

//move the camera.
camera_set_view_pos(view_camera[0], x - camera_get_view_width(camera)/2, y  - camera_get_view_height(camera)/2);

//clamp to the edges of the room. 
camera_set_view_pos(camera,
                    clamp(camera_get_view_x(camera), 0, room_width - camera_get_view_width(camera)),
                    clamp(camera_get_view_y(camera), 0, room_height - camera_get_view_height(camera)));

