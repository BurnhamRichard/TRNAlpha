///attack_state

//instance_create 
vspd += grav;
hspd = approach(hspd, 0, 2);
//consider writing an approach script here
//hspd = -6;
move(solid);
sprite_index = spr_attack_ranged;
//put alarm shiz here
if (alarm[0] = -1) {
alarm = 5;
}

if (canshoot = true) {
instance_create(x, y, obj_bullet);
canshoot = false;
}
alarm[0] = 5; 

//instance_create(110, 67, obj_bullet);


//if (image_index >10) && (image_index <=15)
    //{ instance_create(x, y, obj_hitbox);
    //image_xscale = sign(hspd);
    //}
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

