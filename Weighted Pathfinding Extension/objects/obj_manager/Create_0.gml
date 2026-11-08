
path = -1;

collision_grid = mp_grid_create(0,0, room_width/global.cell_size, room_height/global.cell_size, global.cell_size, global.cell_size);

// weight dictionary for the weight grid to be assigned to. If you change the weights in tl_weights, it should be changed here to reflect it. 
weights = [1,2,3, 4, 5, 10, 25,  75, 150, 999];

weight_array = array_create(room_width/global.cell_size, array_create(room_height/global.cell_size));

var _tl_collision = layer_tilemap_get_id("_collision");
var _tl_weights = layer_tilemap_get_id("_weights");

for (var i = 0; i < room_width/global.cell_size; ++i) {
    for (var j = 0; j < room_height/global.cell_size; ++j) {
		if tilemap_get(_tl_collision, i, j) {
			mp_grid_add_cell(collision_grid, i, j);	
			array_set(weight_array[i], j, -1);
		}
		else {
			var _tl = tilemap_get(_tl_weights, i, j);
			var _ti = tile_get_index(_tl)-1;
			 
		}
		
	}
}

show_message(weight_array)