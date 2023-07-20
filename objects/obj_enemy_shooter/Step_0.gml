// In the enemy object's Step event

// Move the enemy left
x += 1; // Replace "2" with your desired enemy movement speed

// Check if the player is within range
if abs(x - obj_player_ground.x) <= 200 && abs(y - obj_player_ground.y) <= 50 {
    // Get the direction from the enemy to the player
    direction = point_direction(x, y, obj_player.x, obj_player.y);

    // Create a bullet object
    instance_create_layer(x, y, obj_fighter_blast);

    // Set the speed and direction of the bullet
}
