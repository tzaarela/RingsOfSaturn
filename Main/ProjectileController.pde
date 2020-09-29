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
			push();
			fill(255);
			ellipse(projectile.position.x, projectile.position.y, projectile.size, projectile.size);
			pop();
		}
    }

    void move()
    {
		for (Projectile projectile : projectiles) 
		{
			projectile.position.add(projectile.velocity);
			// println("Projectile velocity X: " + projectile.velocity.x);
			// println("Projectile velocity Y: " + projectile.velocity.y);


			// println("Projectile Position X: " + projectile.position.x);
			// println("Projectile Position Y: " + projectile.position.y);
		}
    }

	void spawnBullet(PVector startPosition, float speed)
	{
		PVector direction =  startPosition.copy().mult(-1).normalize();
		println(direction.x);
		println(direction.y);

		PVector velocity = direction.mult(speed);
		println("velocity X: " + velocity.x);
        Projectile projectile = new Projectile(startPosition.copy(), velocity);
		projectiles.add(projectile);
	}

	void destroyBullet()
	{
		
	}


}