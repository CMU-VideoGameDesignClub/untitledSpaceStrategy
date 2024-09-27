// Movement: Left to Right at the bottom of the screen
if (x <= leftBoundary) {
    moveDirection = 1; // Move right
} else if (x >= rightBoundary) {
    moveDirection = -1; // Move left
}

// Accumulate movement
accumulatedMove += moveSpeed * moveDirection;

// Only move in increments when accumulated movement reaches the step size
if (abs(accumulatedMove) >= stepSize) {
    x += stepSize * sign(accumulatedMove); // Move by the step size in the correct direction
    accumulatedMove = 0;  // Reset accumulated movement
}

// Randomized shooting mechanic
if (fireCooldown > 0) {
    fireCooldown--; // Decrease cooldown until the next shot
} else {
    // Create a projectile when cooldown reaches 0
    instance_create_layer(x, y - 10, "Instances", obj_bullet_mj168); // Shoots upwards (y-10)
    
    // Reset the fire cooldown with a random interval
    fireCooldown = irandom_range(fireRate - 30, fireRate + 30); // Randomize cooldown slightly
}
