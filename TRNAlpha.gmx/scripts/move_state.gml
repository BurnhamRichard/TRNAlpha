///move_state()
//original sprite indexes are w=890 and h=1029 and x =445 and y=514
var right = keyboard_check(vk_right);
var left = keyboard_check(vk_left);
var up = keyboard_check(vk_up);
var down =keyboard_check(vk_down);
var up_release = keyboard_check_released(vk_up);
//var dash = keyboard_check_pressed(ord'C'));

//clever controller code
//var gp_num = gamepad_get_device_count();
//for (var i = 0; i < gp_num; i++;)
   //if gamepad_is_connected(i) global.gp[i] = true else global.gp[i] = false; { 
if (gamepad_is_connected(0)) {
   right = gamepad_button_check(0, gp_padr);
   left = gamepad_button_check(0, gp_padl)
   up = gamepad_button_check(0, gp_face1);
   down = gamepad_button_check(0, gp_padd);
   up_release = gamepad_button_check_released(0, gp_face1);
   //dash = gamepad_button_check_pressed(0, gp_face2);
}
//Gravity engine
//sprite_index = spr_bishop_idle;
if (!place_meeting(x, y+1, solid)) {
    vspd += grav;
if (up_release && vspd < -6) {
    vspd = -6;
    }
} else {
    vspd = 0;
    // Jumping code
    if (up) {
        vspd = -16;
    }
}
//Vertical control
if (right) {
    sprite_index = spr_bishop_walk;
    hspd = spd;
    hspd_dir = 1;
    
}

if (left) {
    hspd = -spd;
    sprite_index = spr_bishop_walk;
    hspd_dir = -1;
}

if (hspd != 0) {
    image_xscale = sign(hspd);
    //image_xscale = sign(hspd)*.1;
    //sprite_index = spr_bishop_idle;
    //currently timsing the xscale by 1, consider resizing sprites if possible.
}

//Friction Control
if (!right && !left) {
    sprite_index = spr_bishop_idle;
    hspd = 0;
}
move(solid);

/// Grab check
var falling = y-yprevious > 0;
var wasnt_wall = !position_meeting(x+44*image_xscale, yprevious, solid);
var is_wall = position_meeting(x+44*image_xscale, y, solid);
//var wasnt_wall = !position_meeting(x+445*image_xscale, yprevious, solid);
//var is_wall = position_meeting(x+445*image_xscale, y, solid);

if (falling && wasnt_wall && is_wall) {
    hspd = 0;
    vspd = 0;
    
    // Move against the ledge
    while (!place_meeting(x+image_xscale, y, solid)) {
        x+=image_xscale;
    }
    
    // Make sure we are the right height
    //while (position_meeting(x+445*image_xscale, y-1, solid)) {
    while (position_meeting(x+44*image_xscale, y-1, solid)) {
        y-=1;
    }
    
    sprite_index = spr_bishop_grab;
    state = grab_state;
    }

