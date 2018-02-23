var filter_on = argument0;

if(!is_undefined(my_agent) && my_agent != ""){
	ds_list_clear(my_agent.full_path);
}

//we will store the path in the closed list.
ds_list_clear(closed_list);
var pos_x = end_x;
var pos_y = end_y;
		
var prev_node_temp = [-1,-1,-1,-1,-1]; //pathfinder node.
node = nodes[|end_location_xy]; //pathfinder node.
var node_temp = node;
		
var temp_loc = [end_x, end_y];
var prev_node = [end_x, end_y];

var loc_xy = node_temp[PNF.PY] * grid_x_dim + node_temp[PNF.PX]; //loc_xy is the XY position of the node to be processed next. 
		
//keep going until you hit the start node. 
while (temp_loc[0] != node_temp[PNF.PX] || temp_loc[1] != node_temp[PNF.PY]){

	//get the next pathfinder node
	node = nodes[|loc_xy];
	if(filter_on){
		//initalize some values used in the if conditional.
			
			var closed_list_last = -1;
			var closed_list_last_x = -1;
			var closed_list_last_y = -1;
			if(ds_list_size(closed_list) -1 > -1){
				closed_list_last= closed_list[| ds_list_size(closed_list) - 1];
				closed_list_last_x = closed_list_last[0];
				closed_list_last_y = closed_list_last[1];
			}
			
			
			var p_x = node_temp[PNF.PX];
			var p_y = node_temp[PNF.PY];
			
		if(!is_undefined(my_agent) && my_agent != ""){
			ds_list_add(my_agent.full_path, temp_loc);
		}
	}
	else{
		ds_list_add(closed_list, temp_loc);
	}
	prev_node = temp_loc;
	pos_x = node_temp[PNF.PX];
	pos_y = node_temp[PNF.PY];
	prev_node_temp = node_temp;	
	loc_xy = node_temp[PNF.PY] * grid_x_dim + node_temp[PNF.PX];
	temp_loc = [pos_x, pos_y];
}
			
//ds_list_add(closed_list, temp_loc);
stopped = true;
highlight_path = true;
search_check = true;
return;
