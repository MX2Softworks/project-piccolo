camera = camera_create_view(x, y, view_wport[0], view_hport[0], 0, -1, -1, -1, 32, 32);
view_camera[0] = camera;
follow = obj_player;

xTo = x;	//x coordinate we are moving to
yTo = y;	//y coordinate we are moving to

interpolation_rate = 10; //smooth panning rate, lower value means faster pan.

