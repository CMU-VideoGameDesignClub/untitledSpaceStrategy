// Check if the alien has been "launched" (i.e., isMoving is true)
if (isMoving) {
    // Zigzag movement (left and right)
    var zigzagOffset = sin(degtorad(current_time * zigzagSpeed)) * zigzagAmplitude;

    // Apply zigzag offset to the horizontal position
    x += zigzagOffset;

    // Move downward at a constant speed
    y += downwardSpeed;

    // Destroy the alien if it moves off the bottom of the screen
    if (y > room_height) {
        instance_destroy();
    }
} else {
    // Normal movement (when the alien is part of the formation)

    // Sub-movement for each row (all aliens in the same row move together)
    var rowJiggle = sin(degtorad(current_time / jiggleSpeed)) * jiggleAmplitude;

    // Calculate the new x position, including global formation movement and row-based jiggle
    var newX = homeX + global.formationOffset + global.formationMoveOffset + rowJiggle;

    // Snap the movement to 'stepSize' pixel increments (for retro movement feel)
    x = floor(newX / stepSize) * stepSize; // Movement occurs in increments based on stepSize

    // Optional: Slight vertical bounce (also snapped to stepSize-pixel increments)
    var newY = homeY + sin(degtorad(current_time / 200 + jiggleOffset)) * 2;
    y = floor(newY / stepSize) * stepSize; // Vertical movement also snapped to stepSize increments
}

