/// @description Insert description here
// You can write your code in this editor
//topSprite = redblast
//middleSprite = spr_bullet
//bottomSprite = Sprite28
blockPixel = 32;
randomize()
currentSpawnPointX = obj_ground_generation_y.x
baseOffset = -1
heightVariation = irandom_range(0,5)
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
		
		if(y==currentCollumHieght)
		{
			with(instance_create_layer(currentSpawnPointX,room_height-(y*blockPixel), "Ground", obj_block_brick))
			{sprite_index =spr_g1_top;}
		}
		else if(y==currentCollumHieght-1)
		{
			with(instance_create_layer(currentSpawnPointX,room_height-(y*blockPixel), "Ground", obj_block_brick))
			{sprite_index = spr_g1_middle;}
		}
		else
		{
			with(instance_create_layer(currentSpawnPointX,room_height-(y*blockPixel), "Ground", obj_block_brick))
			{sprite_index = spr_g1_bottom;}
		}
		y++
	}
	
	//makes this collum height the previous collum height for future refrence
	previousCollumHeight = currentCollumHieght
	currentSpawnPointX += blockPixel
	xManip--
}