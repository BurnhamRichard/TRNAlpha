///gorgon_flight_chase_state
if (instance_exists(obj_bishop)) {
    var dir = point_direction(x, y, obj_bishop.x, obj_bishop.y);
    hspd = lengthdir_x(spd, dir);
    vspd = lengthdir_y(spd, dir);
    
    // Change to the flying sprite
    sprite_index = spr_gorgon_attack;
    
    // Face the right diretion
    if (hspd != 0) image_xscale = sign(hspd);
    
    // Move
    move(solid);
}
