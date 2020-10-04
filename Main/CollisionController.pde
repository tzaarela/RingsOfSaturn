class CollisionController  
{
	public CollisionController() 
	{
		
	}

	void update(Player player, 
				ArrayList<Enemy> enemies, 
				ArrayList<Projectile> playerProjectiles, 
				ArrayList<Projectile> enemyProjectiles,
				Astroid astroid)
	{
		for (Enemy enemy : enemies) 
		{
			if(!enemy.isDead)
			{
				for (Projectile projectile : playerProjectiles) 
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

				if(enemy.isColliding(player))
				{
					enemy.isDead = true;
					player.isDead = true;
				}
			}
		}

		if (!player.isDead)
		{
			for (Projectile projectile : enemyProjectiles) 
			{
				if(player.isColliding(projectile))
				{
					player.isDead = true;
					projectile.isDestroyed = true;
				}
			}

			if(player.isColliding(astroid))
			{
				player.isDead = true;
			}
		}
	}
}
