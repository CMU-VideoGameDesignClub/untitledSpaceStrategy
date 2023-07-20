randomize()
startscreenVar = irandom_range(1,2)

if (startscreenVar == 1)
	room_goto(rm_start_screen)
	
if (startscreenVar == 2)
	room_goto(rm_start_screen2)