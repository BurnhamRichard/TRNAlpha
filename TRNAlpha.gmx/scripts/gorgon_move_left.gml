///snake_move_right_state
var wall_at_left = place_meeting(x-1, y, solid);
var ledge_at_left = !position_meeting(bbox_left-1, bbox_bottom+1, solid);

if (wall_at_left) {
    state = gorgon_move_right;
}

if (ledge_at_left) {
    state = gorgon_move_right;
}

image_xscale = -1;

x -= 1;
