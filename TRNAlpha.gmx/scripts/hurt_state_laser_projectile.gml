hspd = -16;
vspd = random(10) or random(-10);

//if (hspd != 0) {
//image_xscale = sign(hspd);
//}
// Apply gravity
if (!place_meeting(x, y+1, solid)) {
    vspd += grav;
} else {
    vspd = 0;
    
    // Use friction
    apply_friction(spd);
}

direction_move_bounce(solid);

//obj_bishopstats.hp += -10;

// Change back to the move state
if (hspd == 0 && vspd == 0) {
    image_blend = c_white;
    state = move_state;
}
