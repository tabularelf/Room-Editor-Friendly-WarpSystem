// Initalizes at game start!
global.warpZoneName = "";
global.isWarping = false;

function room_warp(_room,_warpZoneName) {
    // This ensures that whatever warp we're going to, it's a string.
    global.warpZoneName = string(_warpZoneName);
	
	// Set it to we are warping.
	global.isWarping = true;
        
    // We will check to see if it's we're in the same room or not.
    // So that way we can warp into another location without resetting the room. Handy!
    if (_room != room) {
        room_goto(_room);    
    } else {
        return room_handle_warp();    
    }
}

function room_handle_warp() {
	
	// We will check to see if we have initated a warp.
	if !(global.isWarping) exit;
	
	// We don't want to run the entire function if there's no warp!
	// That's just wasteful!
	if !instance_exists(obj_warpzone) {
		obj_player.x = room_width/2;
		obj_player.y = room_height/2;
	} else {
		// Okay there's a warp! Time to search for it!
		var _inst;
		var _warpFound = false;
		for(var _i = 0; _i < instance_number(obj_warpzone); ++_i) {
		    _inst = instance_find(obj_warpzone, _i);
		    
		    if (_inst.warpName == global.warpZoneName) {
				_warpFound = true;
		        break;    
			}
		}
		
		// Failsafe. Find nearest warp.
		if !_warpFound {
			_inst = obj_warpzone;	
		}
		
		// Put your player at x & y coordinates
		obj_player.x = _inst.x+(_inst.sprite_width/2);
		obj_player.y = _inst.y+(_inst.sprite_height/2);
		
		// Change warp properties, so we don't retrigger it.
		_inst.firstUse = true;
		global.isWarping = false;
	}
}