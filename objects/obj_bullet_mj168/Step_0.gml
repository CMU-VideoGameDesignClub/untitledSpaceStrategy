// Define the step size for movement (you can adjust this value for testing)
stepSize = 16;  // Bullet will move in increments of 16 pixels

// Move the bullet upward
var newY = y - speed; // Move upward by 'speed'

// Snap the movement to 'stepSize' pixel increments
y = floor(newY / stepSize) * stepSize; // Snaps the bullet's vertical movement to stepSize increments
