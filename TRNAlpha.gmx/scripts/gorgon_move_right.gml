///snake_move_right_state
var wall_at_right = place_meeting(x+1, y, solid);
var ledge_at_right = !position_meeting(bbox_right+1, bbox_bottom+1, solid);

if (wall_at_right) {
    state = gorgon_move_left;
}

if (ledge_at_right) {
    state = gorgon_move_right;
}

image_xscale = 1;

x += 1;

