///attack_state
sprite_index = spr_bishop_attack;
if (!place_meeting(x, y+1, solid)) {
    vspd += grav;
}
if (keyboard_check_released(vk_space)) {
    state = move_state;
}

