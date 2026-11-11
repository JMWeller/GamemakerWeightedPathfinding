
path = -1;

collision_grid = mp_grid_create(0,0, room_width/global.cell_size, room_height/global.cell_size, global.cell_size, global.cell_size);

// weight dictionary for the weight grid to be assigned to. If you change the weights in tl_weights, it should be changed here to reflect it. 
weights = [1,2,3, 4, 5, 10, 25,  75, 150, 999];

weight_array = [];

var _tl_collision = layer_tilemap_get_id("_collision");
var _tl_weights = layer_tilemap_get_id("_weights");

var _h = 0;
var _hmax = room_width/global.cell_size;
var _v = 0;
var _vmax = room_height/global.cell_size;

var _cell_amount = (_hmax) * (_vmax);

// converting the tilemap into an array
for (var i = 0; i < _cell_amount; i++) {
   
	var _ctl = tilemap_get(_tl_collision, _h, _v);
		
	if tile_get_index(_ctl) != 0 {
		mp_grid_add_cell(collision_grid, _h, _v);	
		weight_array[i] = 0;
	}
	else {
		var _tl = tilemap_get(_tl_weights, _h, _v);
		//show_message(tile_get_index(_tl))
		var _ti = tile_get_index(_tl)-1;
		weight_array[i] = weights[_ti];
	}
	
	if _h + 1 > _hmax {
		_h = 0;
		_v++
	}
	else {
		_h++;	
	}
	
}

//now we convert it into a buffer so the dll can use it effectively
#macro BUFFER_WEIGHT_BYTE_SIZE 2
weights_buffer_length = array_length(weight_array)*BUFFER_WEIGHT_BYTE_SIZE;
weights_buffer = buffer_create(weights_buffer_length, buffer_fixed, 1);

for (var i = 0; i < array_length(weight_array); ++i) {
	buffer_write(weights_buffer, buffer_u16, weight_array[i]);
}

var index = 1;
show_message(buffer_peek(weights_buffer, index * BUFFER_WEIGHT_BYTE_SIZE, buffer_u16)); 
show_message( DLLWeightValue(buffer_get_address(weights_buffer), index) );


var test_buffer = buffer_create(BUFFER_WEIGHT_BYTE_SIZE, buffer_fixed, 1);
DLLTestWriteToBuffer(buffer_get_address(test_buffer));
show_message(buffer_peek(test_buffer, 0, buffer_u16))