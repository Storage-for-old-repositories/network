if (other._PLAYER != _PLAYER)
{
	temp = other._PLAYER;
	
	with(other)
	{
		instance_destroy();
	}
	
	hp -= 1;
	
	if (hp <= 0)
	{
		x = irandom_range(62,600);
		y = irandom_range(62,600);
		
		hp = 10;
		
		with(o_player)
		{
			if (other.temp == _PLAYER)
			{
				_score++;
			}
		}
	}
}