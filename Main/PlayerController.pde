class PlayerController
{
	float lastShotTime;
	Player player;
	Ring[] rings;
	boolean hasTeleported;
	MoveController moveController;
	ProjectileController projectileController;
	AudioController audioController;

	PlayerController(Ring[] rings)
	{
		this.rings = rings;
		player = new Player(rings[rings.length - 1]);
		moveController = new MoveController(player);
		projectileController = new ProjectileController();

		audioController = new AudioController();
		audioController.loadSound("Sound/weapon_gun_shoot.wav");
		audioController.volumeSound("Sound/weapon_gun_shoot.wav", 0.025);

		audioController.loadSound("Sound/explosion_big_powerful2.wav");
		audioController.volumeSound("Sound/explosion_big_powerful2.wav", 0.15);

		audioController.loadSound("Sound/player_teleport.wav");
		audioController.volumeSound("Sound/player_teleport.wav", 0.75);
		audioController.rateOfSound("Sound/player_teleport.wav", 2f);
	}

	void update()
	{
		if (player.isPlayable)
		{
			moveController.orbit(getInputVector(), 0, 0);
			hasTeleported = moveController.teleport(getInputVector(), rings);
			projectileController.update();

			if (isSpacePressed)
				shoot();

			if (player.isDead)
				die(player);
			else
				draw(hasTeleported);
		}
	}

	void draw(boolean hasTeleported)
	{
		float angle = radians(-moveController.angle);
		PVector input = getInputVector();

		push();
		translate(player.position.x, player.position.y);
		rotate(angle);
		tint(255, 175, 255, 255); 

		if (hasTeleported)
		{
			audioController.playSound("Sound/player_teleport.wav");

			Animation animation = new Animation(25f, player.position, angle, 1, false);
			Animator.animate(animation, "PlayerTeleport");			
			player.teleportAnimation = animation;
		}
		else if (player.teleportAnimation == null)
		{
			println("input x: " + input.x);
			
			if (input.x == 0)
				image(player.sprite, 0, 0);	

			else if (input.x < 0)
				image(player.spriteLeft, 0, 0);	

			else if (input.x > 0)
				image(player.spriteRight, 0, 0);	
		}
		else if (player.teleportAnimation.isDone)
		{
			if (input.x == 0)
				image(player.sprite, 0, 0);	

			else if (input.x < 0)
				image(player.spriteLeft, 0, 0);	

			else if (input.x > 0)
				image(player.spriteRight, 0, 0);	
		}
				
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
		audioController.playSound("Sound/explosion_big_powerful2.wav");
		
		Animation animation = new Animation(100f, player.position, 0, 1.5, false);
		Animator.animate(animation, "Explosion");
		player.isPlayable = false;
    }
}
