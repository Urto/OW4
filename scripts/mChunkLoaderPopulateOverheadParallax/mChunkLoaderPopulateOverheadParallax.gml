///@description Basically just here to organize the method mPopulateWorldChunk more. Populates data for the overhead parallax canvas.
///@arg canvas - The canvas to store this grid to.
///@arg str - The grid string to read from.



var _canvas = argument0;
var _str = argument1;

if (is_undefined(_str))
{
	exit;
}

var _grid = ds_grid_create(1, 1);
ds_grid_read(_grid, _str);

//Get the height of the grid. We won't need the width because it should always be three.
var _h = ds_grid_height(_grid);
var _value = noone;
var _sprite = noone;

//Replace each sprite name in the grid with the index of that sprite.
for (var _y = 0; _y < _h; _y++)
{
	_value = ds_grid_get(_grid, 0, _y);
	_sprite = asset_get_index(_value);
	ds_grid_set(_grid, 0, _y, _sprite);
}

//Now destroy the grid plugged into the chunk and replace with this one.
if (ds_exists(_canvas.parallaxGrid, ds_type_grid))
{
	ds_grid_destroy(_canvas.parallaxGrid);
}
_canvas.parallaxGrid = _grid;