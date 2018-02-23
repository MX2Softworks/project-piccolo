for(var i = 0; i < ds_list_size(full_path); i++){
		
		var node = full_path[|i];
		draw_set_alpha(.25);
		draw_rectangle_colour(node[0] * pathfinder.chunk_size, 
							  node[1] * pathfinder.chunk_size, 
							  node[0] * pathfinder.chunk_size + pathfinder.chunk_size, 
							  node[1] * pathfinder.chunk_size + pathfinder.chunk_size,
							  c_blue, c_blue, c_blue, c_blue,
							  true);
					
		draw_set_alpha(1);
}

draw_self();
