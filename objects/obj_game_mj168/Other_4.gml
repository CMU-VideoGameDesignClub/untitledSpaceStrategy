// Initialize random seed
randomize();

// Stop any currently playing audio and start background music
audio_stop_all();
audio_play_sound(snd_backgroundSound, 2, true); // Play background sound with looping

// Spawn the enemy ship at a specific position near the bottom of the room
var enemy_x = room_width / 2; // Center horizontally
var enemy_y = room_height - 100; // Position it near the bottom (adjust as needed)

// Create the ship at the bottom
instance_create_layer(enemy_x, enemy_y, "Instances", obj_space_defender);

// Optional: Spawn more enemies if needed
// You can adjust the positions or create a grid pattern if you want multiple enemies

// Number of rows and columns for the alien group
var rows = 4;
var columns = 8;

// Spacing between the aliens
var alien_spacing_x = 80; // Horizontal spacing between aliens
var alien_spacing_y = 80; // Vertical spacing between rows

// Calculate total width of the formation
var formation_width = (columns - 1) * alien_spacing_x + 64;

// Starting position: Center the formation horizontally
var start_x = (room_width - formation_width) / 2;
var start_y = 50;  // Y position near the top of the screen

// Loop through rows and columns to create the grid of aliens
for (var row = 0; row < rows; row++) {
    for (var col = 0; col < columns; col++) {
        // Calculate the X and Y position for each alien
        var alien_x = start_x + (col * alien_spacing_x);
        var alien_y = start_y + (row * alien_spacing_y);
        
        // Create the alien instance
        instance_create_layer(alien_x, alien_y, "Instances", obj_alien_1);
    }
}
