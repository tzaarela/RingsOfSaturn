class ProjectileController
{
	ArrayList<Projectile> projectiles;


	ProjectileController(Entity entity)
	{
		projectiles = new ArrayList<Projectile>();
	}


    void update()
    {
		for (int i = 0; i < projectiles.size(); ++i) 
		{
			Projectile projectile = projectiles.get(i);
				
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
		projectile.position.add(projectile.velocity);
    }

	void spawnBullet(PVector startPosition, float speed)
	{
		PVector direction =  startPosition.copy().mult(-1).normalize();
		// println(direction.x);
		// println(direction.y);

		PVector velocity = direction.mult(speed);
		// println("velocity X: " + velocity.x);
        Projectile projectile = new Projectile(startPosition.copy(), velocity);
		projectiles.add(projectile);
	}

	void destroyBullet(Projectile projectile)
	{
		projectiles.remove(projectile);
	}


}