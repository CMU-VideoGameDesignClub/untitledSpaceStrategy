// Store the initial position as the alien's "home" position in the formation
homeX = x;
homeY = y;

// Randomize individual jiggle for each alien
jiggleAmplitude = random_range(2, 5);   // Each alien has a random jiggle amplitude
jiggleSpeed = random_range(2, 5);       // Each alien has a random jiggle speed
jiggleOffset = random(360);             // Random offset to make the jiggle start at a different point for each alien

// Define the step size for movement (change this variable to test different increments)
stepSize = 16;  // Movement will occur in 8-pixel increments (change this value to test)
isMoving =  false

downwardSpeed = 4
