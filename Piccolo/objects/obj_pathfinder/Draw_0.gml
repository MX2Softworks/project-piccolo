//draw_self();


if(self.debug_toggle){
	for(var x_index = 0; x_index < self.grid_x_dim; x_index++){
		for(var y_index = 0; y_index < self.grid_y_dim; y_index++){
			if(self.grid[x_index, y_index] == 1){
				draw_rectangle_color(x_index * self.chunk_size, y_index*chunk_size, x_index*chunk_size + chunk_size, y_index*chunk_size + chunk_size, c_green, c_green, c_green, c_green, true);
			}
			else{
				draw_rectangle_color(x_index * self.chunk_size, y_index*chunk_size, x_index*chunk_size + chunk_size, y_index*chunk_size + chunk_size, c_aqua, c_aqua, c_aqua, c_aqua, false);
			}
		}
	}
}

if(highlight_path){
	for(var index = ds_list_size(closed_list) - 1; index >= 0; index--){
		var node = closed_list[|index];
		draw_rectangle_color(node[0] * chunk_size, node[1]*chunk_size, node[0]*chunk_size + chunk_size, node[1]*chunk_size + chunk_size, c_red, c_red, c_red, c_red, true);
		draw_text_color(node[0]*chunk_size +1, node[1]*chunk_size + 1, string(index), c_black, c_black, c_black, c_black, 1);
	}
}

