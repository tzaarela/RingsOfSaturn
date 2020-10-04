class CollisionController  
{
	public CollisionController() 
	{
		
	}

	void update(Player player, ArrayList<Enemy> enemies, ArrayList<Projectile> projectiles, Astroid astroid)
	{
		for (Enemy enemy : enemies) 
		{
			if(!enemy.isDead)
			{
				for (Projectile projectile : projectiles) 
				{
					if(enemy.isColliding(projectile))
					{
						enemy.takeDamage(projectile.damage);
						projectile.isDestroyed = true;
					}
				}	
				
				if(enemy.isColliding(astroid))
				{
					enemy.isDead = true;
				}
			}
		}

		if(player.isColliding(astroid))
		{
			player.isDead = true;
		}
	}
}
