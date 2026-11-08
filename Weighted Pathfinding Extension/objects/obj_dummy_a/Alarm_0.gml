
path = path_add();

mp_grid_path(obj_manager.collision_grid, path, x, y, global.target_cell[0]*global.cell_size, global.target_cell[1]*global.cell_size, true );

path_start(path, 1, path_action_stop, false)