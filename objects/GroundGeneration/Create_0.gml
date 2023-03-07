/// @description Insert description here
// You can write your code in this editor
randomize()
currentSpawnPointX = GroundGeneration.x
heightVariation = 1//irandom_range(-1,1)
previousCollumHeight = 0
//x = irandom_range(64,512)
x = irandom_range(1,10)

//test[x]
while(x>0)
{
	//creates base block for this collum
	instance_create_layer(currentSpawnPointX, GroundGeneration.y, "Instances", obj_block_brick)
//	temp = 128
	//sets current collum height
//	currentCollumHieght = irandom_range(-1, 1) //previousCollumHeight + irandom_range(-heightVariation, heightVariation)
	//creating a maniputation variable
//	if(currentCollumHieght <=0)
//	{
//		currentCollumHieght = 1
//	}
	y = 1
	while(y<=1)//currentCollumHieght)
	{
		instance_create_layer(currentSpawnPointX, GroundGeneration.y + 128, "Instances", obj_block_brick)
//		temp += 128
		y++
	}
	
	//makes this collum height the previous collum height for future refrence
//	previousCollumHeight = currentCollumHieght
	currentSpawnPointX += 128
	x--
}