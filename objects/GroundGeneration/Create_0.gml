/// @description Insert description here
// You can write your code in this editor
randomize()
currentSpawnPointX = GroundGeneration.x-128
baseOffset = 20
heightVariation = irandom_range(1,10)
previousCollumHeight = 0
x = irandom_range(64,512)
xManip = x

while(xManip>0)
{
	//creates base block for this collum
	//instance_create_layer(currentSpawnPointX,room_height-256, "Instances", obj_block_brick)
	//sets current collum height
	currentCollumHieght = previousCollumHeight + irandom_range(-heightVariation, heightVariation)
	//creating a maniputation variable
	if(xManip==x)
	{
		currentCollumHieght += baseOffset;
	}
	
	if(currentCollumHieght <=0)
	{
		currentCollumHieght = 1
	}
	y = 0
	
	while(y<=currentCollumHieght)
	{
		instance_create_layer(currentSpawnPointX,room_height-256-(y*128), "Instances", obj_block_brick)
		y++
	}
	
	//makes this collum height the previous collum height for future refrence
	previousCollumHeight = currentCollumHieght
	currentSpawnPointX += 128
	xManip--
}