global.chat = ds_list_create();
global.chat_color = ds_list_create();

// con_chat and con_gui must match here
ds_list_add(global.chat,"Welcome to the Multiplayer Test.","v0.08092023","","","");
ds_list_add(global.chat_color,c_white,c_white,c_white,c_white,c_white,);

// on and off switch
active = false;

//how many chat messages
chatSize = 5;

// chat message
chat_text = "";