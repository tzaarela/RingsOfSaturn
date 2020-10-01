class ProjectileController
{
	ArrayList<Projectile> projectiles;
	float velocityMultiplier;


	ProjectileController(Entity entity)
	{
		projectiles = new ArrayList<Projectile>();
		velocityMultiplier = 100f;
	}


    void update()
    {
		for (int i = 0; i < projectiles.size(); ++i) 
		{
			Projectile projectile = projectiles.get(i);

			destoyIfOutsideBoundary(projectile);
				
			if (projectile.isDestroyed)
			{
				projectiles.remove(projectile);
			}
			else
			{
				move(projectile);
				draw(projectile);
			}
		}
    }

    void draw(Projectile projectile)
    {
		push();
		fill(255);
		stroke(#89F3FF);
		strokeWeight(20);
		ellipse(projectile.position.x, projectile.position.y, projectile.size, projectile.size);
		pop();
    }

    void move(Projectile projectile)
    {
		projectile.position.add(PVector.mult(projectile.velocity, deltaTime * velocityMultiplier));
    }

	void spawnBullet(PVector startPosition, float speed)
	{
		PVector direction =  startPosition.copy().mult(-1).normalize();
		PVector velocity = direction.mult(speed);

        Projectile projectile = new Projectile(startPosition.copy(), velocity);
		projectiles.add(projectile);
	}

	void destroyBullet(Projectile projectile)
	{
		projectiles.remove(projectile);
	}

	void destoyIfOutsideBoundary(Projectile projectile)
	{
		if (projectile.position.x < -resolutionX/2 || projectile.position.x > resolutionX/2)
			projectile.isDestroyed = true;

		if (projectile.position.y < -resolutionY/2 || projectile.position.y > resolutionY/2)
			projectile.isDestroyed = true;
	}
}