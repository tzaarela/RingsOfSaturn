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
			stroke(#89F3FF);
			strokeWeight(100);
			ellipse(projectile.position.x, projectile.position.y, projectile.size, projectile.size);
			pop();
		}
    }

    void move()
    {
		for (Projectile projectile : projectiles) 
		{
			projectile.position.add(projectile.velocity);
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