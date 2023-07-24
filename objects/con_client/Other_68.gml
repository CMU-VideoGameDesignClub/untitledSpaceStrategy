// gets value of key "type" and store in variable "type_event" - Data Structure
type_event = ds_map_find_value(async_load,"type");

// switch statement for events in Data Structure
switch(type_event)
{
	// when packet is received from the server ->
	case network_type_data:
	
		// grab the buffer
		buffer = ds_map_find_value(async_load,"buffer");
		
		// going to the start of buffer
		buffer_seek(buffer,buffer_seek_start,0);
		
		// script of possibilities
		received_packet_client(buffer);
		
		break;
}