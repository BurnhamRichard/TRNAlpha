///move_state()
var right = keyboard_check(vk_right);
var left = keyboard_check(vk_left);
var up = keyboard_check(vk_up);
var down =keyboard_check(vk_down);
var up_release = keyboard_check_released(vk_up);

//Gravity engine
if (!place_meeting(x, y+1, solid)) {
    vspd += grav;

    sprite_index = spr_bishop_jump;
    image_speed = 0;
    image_index = (vspd > 0);
    
   //Player is in the air
   //sprite_index = spr_bishop_jump;
   // image_speed = 0;
    //image_index = (vspd > 0);
    
    // Control the jump height
    if (up_release && vspd < -6) {
        vspd = -6;
    }
} else {
    vspd = 0;
    
    // Jumping code
    if (up) {
        vspd = -16;
    }
    
    //Player on ground
    if (hspd == 0) {
        sprite_index = spr_bishop_idle;
        image_speed = 0;
        image_index = (hspd > 0);
    } else {
        sprite_index = spr_bishop_walk;
        image_speed = 0;
        image_index = (1);
    }
}


//Vertical control
if (right) {
    hspd = spd;
    hspd_dir = 1;
}

if (left) {
    hspd = -spd;
    hspd_dir = -1;
}

if (hspd != 0) {
    image_xscale = sign(hspd)*.1;
    //currently timsing the xscale by 1, consider resizing sprites if possible.
}

//Friction Control
if (!right && !left) {
    hspd = 0;
}
move(solid);

/// Grab check
var falling = y-yprevious > 0;
var wasnt_wall = !position_meeting(x+445*image_xscale, yprevious, solid);
var is_wall = position_meeting(x+445*image_xscale, y, solid);

if (falling && wasnt_wall && is_wall) {
    hspd = 0;
    vspd = 0;
    
    // Move against the ledge
    while (!place_meeting(x+image_xscale, y, solid)) {
        x+=image_xscale;
    }
    
    // Make sure we are the right height
    while (position_meeting(x+445*image_xscale, y-1, solid)) {
        y-=1;
    }
    
    sprite_index = spr_bishop_grab;
    state = grab_state;
    
}
