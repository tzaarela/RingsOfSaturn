class ProjectileController
{
	ArrayList<Projectile> projectiles;


	ProjectileController(Entity entity)
	{
		projectiles = new ArrayList<Projectile>();
	}


    void update()
    {
        move();
        draw();
    }

    void draw()
    {
		for (Projectile projectile : projectiles) 
		{
			ellipse(projectile.position.x, projectile.position.y, projectile.size, projectile.size);
		}
    }

    void move()
    {
		for (Projectile projectile : projectiles) 
		{
			projectile.position.add(projectile.velocity);
			println("Projectile Position X: " + projectile.position.x);
			println("Projectile Position Y: " + projectile.position.y);
		}
    }

	void spawnBullet(PVector startPosition, float speed)
	{
		PVector direction = PVector.mult(startPosition, -1).normalize();
		PVector velocity = direction.mult(speed);

        Projectile projectile = new Projectile(startPosition, velocity);
		projectiles.add(projectile);
	}

	void destroyBullet()
	{
		
	}


}