//inputs
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);

//Movements, 
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;


if (place_meeting(x, y + vsp, oGround) && (key_jump))
{
	vsp = -15;
}


//Horizontal Collision Wall
if (place_meeting(x + hsp, y, oWall))
{
	while (!place_meeting(x + sign(hsp), y, oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
//Horizontal Collision Ground
if (place_meeting(x + hsp, y, oGround))
{
	while (!place_meeting(x + sign(hsp), y, oGround))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;


//Vertical Collision Wall
if (place_meeting(x, y + vsp, oWall))
{	
	while (!place_meeting(x, y + sign(vsp), oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
//Vertical Collision Ground
if (place_meeting(x, y + vsp, oGround))
{
	while (!place_meeting(x, y + sign(vsp), oGround))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

