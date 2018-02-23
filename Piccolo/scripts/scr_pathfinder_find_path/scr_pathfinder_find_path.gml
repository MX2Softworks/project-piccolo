
	//supplied parameters.
	var start_x = argument0;
	var start_y = argument1;
	var end_x = argument2;
	var end_y = argument3;
	
	var filter_on = argument4;
	var debug = argument5;
	
	closed_node_counter = 0;
	//if we finished a previous search, a previous search is invalid, or we search too long. 
	if( (found && stopped) || (!found && !stopped) || search_counter > 10){
	
		search_counter = 0;
		highlight_path = false; //used to draw path.
	
		//if end goal is untraversable or blocked, return null
		if(grid[end_x, end_y] == 0){ return noone; }
	
		found = false; 
		stop = false; 
		stopped = false;
		closed_node_counter = 0;
		is_open += 2; 
		is_closed += 2;
		search_limit = 1500;
	
		//make a new location
		location = [-1,-1]
		location[L.xy] = start_y * grid_x_dim + start_x
		end_location_xy = end_y * grid_x_dim + end_x
	
		//init the first location to put in the graph.
		var first_node = [-1,-1,-1,-1,-1];
		first_node[PNF.G] = 0;
		first_node[PNF.F] = H_estimate;
		first_node[PNF.PX] = start_x;
		first_node[PNF.PY] = start_y;
		first_node[PNF.status] = is_open;
		

		//add the first node and its location to the open_list and touched_locations
		nodes[|location[L.xy]] = first_node
		ds_priority_add(open_list, location, first_node[PNF.F]);
	
	}
	else {
		stopped = false;
		stop = false;
		closed_node_counter = 0;
	}
	
	while(ds_priority_size(open_list) > 0){
		
		if(found) break;
		location = ds_priority_find_min(open_list);
		ds_priority_delete_min(open_list);
		
		//Is it in closed list? means this node was already processed
		node = nodes[|location[L.xy]]
		
		//If its in the closed list, skip it. 
		if (node[PNF.status] == is_closed)
			continue;
		
		//get the coordinates from the location
		location_x = floor(location[L.xy] % grid_x_dim)
		location_y = floor(location[L.xy] / grid_x_dim)

		//if we are at the end, end. 
		if (location[L.xy] == end_location_xy){
			node = nodes[|location[L.xy]];
			node[PNF.status] = is_closed;
			found = true; 
			
		}
		
		//if we hit our search limit, terminate.
		if (!found && closed_node_counter > search_limit){
			stopped = true; 
			exit;
		}
		
		if(get_timer() - timer > global.frame_time * .5){
			stopped = true; 
			exit;
		}
		
		var lim = 4;
		if(diagonal_valid)	lim = 8;
		for (var i=0; i < lim; i++) /*if diagonals are allowed then 8 neighbors, else then 4*/ {
			
			if(found) break;
			
			var dir = direction_vector[i];
			new_location_x = location_x + dir[0];
			new_location_y = location_y + dir[1];
			
			//if out of bounds, continue.
			if(new_location_x < 0 || new_location_x >= grid_x_dim || new_location_y < 0 || new_location_y >= grid_y_dim || grid[new_location_x, new_location_y] == 0)
			{
				continue;
			}
			new_location_xy  = new_location_y * grid_x_dim + new_location_x;
			
			//calculate the new g
			node = nodes[|location[L.xy]];
			new_G = node[PNF.G] + grid[new_location_x, new_location_y];

			//initialize H based on heuristic variables 
			switch(formula){
				case "man": H = H_estimate * (abs(new_location_x - end_x) + abs(new_location_y - end_y));
			}
			
			//create new node to add
			var new_node =  [-1,-1,-1,-1,-1];
			new_node[PNF.PX] = location_x;
			new_node[PNF.PY] = location_y;
			new_node[PNF.G] = new_G;
			new_node[PNF.F] = new_G + H;
			new_node[PNF.status] = is_open;
			
			nodes[|new_location_xy] = node
			
			//add to the open list.
			var temp_location = [new_location_xy];
			ds_priority_add(open_list, temp_location, new_node[PNF.F]);
		}
		
		//finished searching through all the neighbors. 
		//mark this node as in the closed list.
		node = nodes[|location[L.xy]];
		node[PNF.status] = is_closed;
		nodes[|location[L.xy]] = node_list;
		closed_node_counter++;
	}	
	if (found){
		scr_pathfinder_reconstruct_path(filter_on);
		return;
	}
		
	stopped = true;
	search_counter++;
	return;
