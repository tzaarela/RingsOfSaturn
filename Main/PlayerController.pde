class PlayerController
{
	float lastShotTime;
	Player player;
	Ring[] rings;
	MoveController moveController;
	ProjectileController projectileController;
	AudioController audioController;

	PlayerController(Ring[] rings)
	{
		player = new Player(rings[rings.length - 1]);
		moveController = new MoveController(player);
		projectileController = new ProjectileController();
		audioController = new AudioController();
		audioController.loadSound("zapsplat_science_fiction_weapon_gun_shoot_003_32196.wav");
		audioController.volumeSound("zapsplat_science_fiction_weapon_gun_shoot_003_32196.wav", 0.025);

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
		tint(255, 175, 255, 255); 
		image(player.sprite, 0, 0);	
		pop();	
	}

	void shoot()
    {
		float currentTime = millis();		

		if (currentTime - lastShotTime > player.fireCooldown)
		{
			audioController.stopSound("zapsplat_science_fiction_weapon_gun_shoot_003_32196.wav");
			audioController.playSound("zapsplat_science_fiction_weapon_gun_shoot_003_32196.wav");
			
			projectileController.spawnBullet(player.position, 8, BulletType.player);
			lastShotTime = currentTime;
		}
    }

    void die()
    {

    }
}
