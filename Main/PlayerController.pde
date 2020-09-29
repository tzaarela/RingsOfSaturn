class PlayerController
{
	Player player;
	Ring[] rings;
	MoveController moveController;
	ProjectileController projectileController;


	PlayerController(Ring[] rings)
	{
		player = new Player(rings[rings.length - 1]);
		moveController = new MoveController(player);
		projectileController = new ProjectileController(player);
		this.rings = rings;
	}

	void update()
	{
		moveController.lineMove(getInputVector());
		moveController.lineStep(getInputVector(), rings);
		projectileController.update();

        if (isFiring)
			shoot();

		draw();
	}

	void draw()
	{
		push();
		fill(255);
		ellipse(player.position.x, player.position.y, player.size, player.size);
		pop();
	}

	void shoot()
    {
		projectileController.spawnBullet(player.position, 10);
		//println("Shooting");
    }

    void die()
    {

    }
}