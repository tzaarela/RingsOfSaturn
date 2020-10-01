class PlayerController
{
	float lastShotTime;
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

        if (isSpacePressed)
			shoot();

		draw();
	}

	void draw()
	{
		push();
		translate(player.position.x, player.position.y);
		rotate(radians(-moveController.angle));
		tint(#c874b2, 255);
		image(player.sprite, 0, 0);	
		pop();	
	}

	void shoot()
    {
		float currentTime = millis();

		if (currentTime - lastShotTime > player.fireCooldown)
		{
			projectileController.spawnBullet(player.position, 8);
			lastShotTime = currentTime;
		}
    }

    void die()
    {

    }
}
