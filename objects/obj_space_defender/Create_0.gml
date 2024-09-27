// Initialize variables
moveSpeed = 2;         // Speed at which the enemy moves (adjust this to tune the feel)
moveDirection = 1;     // Start moving to the right (1 = right, -1 = left)

fireRate = 60;         // Time between shots (1 second at 60fps)
fireCooldown = fireRate; // Initialize cooldown to the fireRate

// Define boundaries for movement
leftBoundary = 550;     // Left limit of the screen for movement
rightBoundary = room_width - 550; // Right limit of the screen for movement

// Step size for snapping
stepSize = 16;  // Movement occurs in 8-pixel increments

// Accumulated movement variable
accumulatedMove = 0;
