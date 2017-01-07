///gorgon_flight_idle_state
image_index = spr_gorgon_idle; 

//Look for Bishop
if (instance_exists(obj_bishop)) {
    var dis = point_distance (x, y, obj_bishop.x, obj_bishop.y);
    
    if (dis < sight) {
     state = gorgon_flight_chase_state;
        }
}
