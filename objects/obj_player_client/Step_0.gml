displayX = 1920;
displayY = 1080;

move_wrap(true, true, 0)

camera_set_view_size(view_camera[0], displayX + (obj_player_client.speed*obj_player_client.speed)*1.6, displayY + (obj_player_client.speed*obj_player_client.speed)*.9);
