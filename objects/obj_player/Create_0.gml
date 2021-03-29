/// @description Cat Judges your code
/* 
    |\__/,|   (`\
  _.|o o  |_   ) )
-(((---(((--------
Cat Judges your code
*/

if (instance_number(obj_player) > 1) {
	instance_destroy(instance_find(obj_player, 1));
}

spd = 2;
image_xscale = 4;
image_yscale = 4;