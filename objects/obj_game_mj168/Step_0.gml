if keyboard_check_pressed(vk_insert) {
    audio_stop_all();
    audio_play_sound(snd_secret_track, 2, true);
}

if keyboard_check_pressed(vk_escape) {
    game_end();
}

// Jiggle movement (subtle side-to-side within formation)
global.formationOffset = sin(degtorad(current_time / 2)) * formationJiggleAmplitude;

// Slow left-to-right movement of the entire formation
global.formationMoveOffset = sin(degtorad(current_time / 400)) * formationMoveAmplitude;

// Detect spacebar press to launch an alien
if (keyboard_check_pressed(vk_space)) {
	
    // Start from the last alien and go backward
    var alienFound = false;
    
    for (var i = instance_number(obj_alien_1) - 1; i >= 0; i--) {
        var alien = instance_find(obj_alien_1, i);
        
        // If an alien is found that hasn't been launched
        if (alien != noone && !alien.isMoving) {
			
			audio_play_sound(snd_launch_mj168, 1, false)
			
            // Set properties to start moving
            alien.zigzagAmplitude = 8;  // Amplitude of the zigzag (how wide)
            alien.zigzagSpeed = 0.1;    // Speed of the zigzag
            alien.downwardSpeed = 2;    // Speed at which it moves downward
            alien.direction = 270;      // Set direction to downwards (270 degrees)
            
            // Mark the alien as "launched" so it doesn't stay in formation
            alien.isMoving = true;
            alienFound = true;
            break;  // Exit the loop after launching one alien
        }
    }

    // Optional: If no aliens are available (you can add logic here if needed)
    if (!alienFound) {
        // Optional logic if no aliens are available to launch
    }
}
