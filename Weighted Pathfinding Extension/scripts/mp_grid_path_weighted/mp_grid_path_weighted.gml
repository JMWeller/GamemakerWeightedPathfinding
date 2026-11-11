function mp_grid_path_weighted(_weights_array_buffer_address, _path, _grid_cell_size, _grid_width, _grid_height, _start_x, _start_y, _goal_x, _goal_y) {
	// translate raw x and y coordinates into cell indexes
	var _xs = floor(_start_x / _grid_cell_size); 
	var _ys = floor(_start_y / _grid_cell_size); 
	
	var _start_index = _ys * _grid_width + _xs;
	
	var _xg = floor(_goal_x / _grid_cell_size); 
	var _yg = floor(_goal_y / _grid_cell_size); 
	
	var _goal_index = _yg * _grid_width + _xg;

	var _maximum_path_points = _grid_width * _grid_height;
	
	// this will be our 'ambassador' for gamemaker and the dll, we will give the dll this buffer to affect then use it to rebuild the path.
	var _point_buffer = buffer_create(_maximum_path_points * BUFFER_WEIGHT_BYTE_SIZE, buffer_fixed, 1);
	
}