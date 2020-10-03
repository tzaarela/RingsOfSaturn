class ProjectileController
{
	ArrayList<Projectile> projectiles;
	float velocityMultiplier;
	BulletType bulletType;

	ProjectileController()
	{
		projectiles = new ArrayList<Projectile>();
		velocityMultiplier = 0.4f;
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
			switch (bulletType) 
			{
				case player:
					fill(255);
					stroke(#89F3FF);
					strokeWeight(20);
					ellipse(projectile.position.x, projectile.position.y, projectile.size, projectile.size);
					break;

				case enemy:
					fill(255);
					stroke(200);
					strokeWeight(10);
					ellipse(projectile.position.x, projectile.position.y, projectile.size, projectile.size);
					break;
			}
		pop();
    }

    void move(Projectile projectile)
    {
		projectile.position.add(PVector.mult(projectile.velocity, deltaTime * velocityMultiplier));
    }

	void spawnBullet(PVector startPosition, float speed, BulletType bulletType)
	{
		this.bulletType = bulletType;
		PVector direction = new PVector();

		switch (bulletType) 
		{
			case player:
				
				PVector mousePosition = new PVector(mouseX - resolutionX / 2, mouseY - resolutionY / 2);
				direction = mousePosition.sub(startPosition).normalize();
				break;

			case enemy:
				direction = startPosition.copy().mult(-1).normalize();
				break;
		}

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