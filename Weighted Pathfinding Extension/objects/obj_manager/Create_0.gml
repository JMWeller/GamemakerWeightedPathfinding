
path = -1;

collision_grid = mp_grid_create(0,0, room_width/global.cell_size, room_height/global.cell_size, global.cell_size, global.cell_size);

// weight dictionary for the weight grid to be assigned to. If you change the weights in tl_weights, it should be changed here to reflect it. 
weights = [1,2,3, 4, 5, 10, 25,  75, 150, 999];

weight_grid = ds_grid_create(room_width/global.cell_size, room_height/global.cell_size)

var _tl_collision = layer_tilemap_get_id("_collision");
var _tl_weights = layer_tilemap_get_id("_weights");

for (var i = 0; i < room_width/global.cell_size; ++i) {
    for (var j = 0; j < room_height/global.cell_size; ++j) {
		if tilemap_get(_tl_collision, i, j) {
			mp_grid_add_cell(collision_grid, i, j);	
		}
		
		var _weight_tl = tilemap_get(_tl_weights, i, j);
		
		var _weight_index = weights[tile_get_index(_weight_tl)-1];
		ds_grid_set(weight_grid,i, j, _weight_index );
		
	}
}

