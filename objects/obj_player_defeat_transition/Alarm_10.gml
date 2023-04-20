// Increase the cell size by 1
// This event runs when the first room is ending, so the pixelation is increased
cellSize += 1;

// Apply the new cell size to the filter
fx_set_parameter(transition_filter, "g_CellSize", cellSize);

// Run Alarm 10 again in the next frame
alarm[10] = 1;