// for testing purposes. Usually, in a game, each entity would know this for themselves in some capacity.
global.target_cell = [65, 25];

global.cell_size = 16;

/*
var size = 65536;
var bf = buffer_create(size * buffer_sizeof(buffer_s32), buffer_fixed, 1);

var i = 1;
while (buffer_tell(bf) < buffer_get_size(bf)) {
	buffer_write(bf, buffer_s32, i);
	i++;
}

show_message(size * (size + 1) / 2 )

show_message( DLLBufferSum(buffer_get_address(bf), size) )
*/