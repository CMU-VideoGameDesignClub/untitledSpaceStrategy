client = network_create_socket(network_socket_tcp);
network_connect(client, "127.0.0.1", 64198);

client_buffer = buffer_create(1024, buffer_fixed,1);
