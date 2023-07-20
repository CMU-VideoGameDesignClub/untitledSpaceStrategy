// Create event
speed = 2;  // set the speed of the enemy
health = 3;  // set the health of the enemy

// Step event
var player = instance_nearest(x, y, obj_player_ground);  // get the nearest player object
if player != noone {  // if there is a player object nearby
   move_towards_point(player.x, player.y, speed);  // move towards the player
   if distance_to_object(player) < 16 {  // if the enemy is close enough to the player
      player.playerHealth -= 1;  // reduce the player's health by 1
      instance_destroy(player);  // destroy the enemy object
	  instance_create_layer(0, 0, "Instances", obj_player_defeat_transition);
	  room_restart()
   }
}

// Destroy event
// add any necessary code here
