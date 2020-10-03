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
		audioController.loadSound("Sound/weapon_gun_shoot.wav");
		audioController.volumeSound("Sound/weapon_gun_shoot.wav", 0.009);

		audioController.loadSound("Sound/explosion_big_powerful.wav");
		audioController.volumeSound("Sound/explosion_big_powerful.wav", 0.1);

		this.rings = rings;
	}

	void update()
	{
		if (player.isPlayable)
		{
			moveController.orbit(getInputVector(), 0, 0);
			moveController.lineStep(getInputVector(), rings);
			projectileController.update();

			if (isSpacePressed)
				shoot();

			if (player.isDead)
				die(player);
			else
				draw();
		}
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
			audioController.stopSound("Sound/weapon_gun_shoot.wav");
			audioController.playSound("Sound/weapon_gun_shoot.wav");
			
			projectileController.spawnBullet(player.position, 5000, BulletType.player);
			lastShotTime = currentTime;
		}
    }

    void die(Player player)
    {
		audioController.playSound("Sound/explosion_big_powerful.wav");
		
		Animation animation = new Animation(100f, player.position, 0, 1.5, false);
		Animator.animate(animation, "Explosion");
		player.isPlayable = false;
    }
}
