///attack_state

sprite_index = spr_bishop_attack;
vspd += grav;
hspd = approach(hspd, 0, 2);
//consider writing an approach script here
//hspd = -6;
move(solid);

if (image_index >14) && (image_index <=15) { 
    instance_create(x, y, obj_hitbox);
} 
    
    //image_xscale = sign(hspd);
    
    //}
    //if (hspd != 0) {
        //obj_hitbox.image_xscale = (sign)hspd ;    
    //
        //with(instance_create(x,y,obj_hitbox))
        //{
            //image_xscale = other.image_xscale;
            //with(instance_place(x, y, obj_gorgon_flight))
            //{
                //if (hit == 0);
                //{
                //hit = 1;
                //vspd = -3;
                //hspd = sign(x - other.x) *4;
                //image_xscale = sign(hspd); 
            //}
        //}
    //}
//}
    
if (keyboard_check_released(vk_space)) {
    state = move_state;
}

