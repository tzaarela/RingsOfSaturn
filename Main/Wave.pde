public class Wave  
{
	float enemyCircleLimit = 360;
	float enemyAttackLimit = 440;
	float enemySpawnMultiplier = 4;
	float newWaveTimer = 2000;

	float totalEnemies;
	float level;
	float waveEndTimer;
	float lastShotTime;

	boolean hasEnemiesSpawned;
	boolean hasCreatedEnemies;
	ProjectileController projectileController;
	Player player;

	ArrayList<Enemy> enemies;
	ArrayList<Enemy> spawningEnemies;
	ArrayList<Enemy> animatedEnemies;

	AudioController audioController;

	public Wave(float level, Player player) 
	{
		this.level = level;
		this.player = player;
		this.totalEnemies = level * enemySpawnMultiplier;
		enemies = new ArrayList<Enemy>();
		spawningEnemies = new ArrayList<Enemy>();
		animatedEnemies = new ArrayList<Enemy>();
		projectileController = new ProjectileController();
		audioController = new AudioController();
		audioController.loadSound("zapsplat_explosion_big_powerful_internal_002_48731.wav");
		audioController.volumeSound("zapsplat_explosion_big_powerful_internal_002_48731.wav", 0.15);
	}

	void update()
	{
		for (int i = 0; i < enemies.size(); ++i) 
		{
			Enemy enemy = enemies.get(i);
			if(enemy.isDead)
			{
				destroyEnemy(enemy);
				continue;
			}

			push();
				translate(enemy.position.x, enemy.position.y);
				moveEnemy(enemy);
				// if(enemy.mode == EnemyMode.isCircling)
				// {	
				// 	projectileController.update();
				// 	//shoot(enemy);
				// }

				draw(enemy);
			pop();	
		}
	}

	void draw(Enemy enemy)
	{
		image(enemy.sprite, 0, 0);
	}

	void moveEnemy(Enemy enemy)
	{
		float currentTime = millis();

		if (currentTime - enemy.spawnTime > enemy.circleTime)
		{
			enemy.mode = EnemyMode.isEscaping;
		}

		enemy.velocity.limit(enemy.maxSpeed);

		switch (enemy.mode) 
		{
			case isFighting :

				enemy.position.limit(enemyCircleLimit);

				if(currentTime - enemy.startPatrolTime > enemy.patrolTime)
				{
					enemy.velocity = new PVector(random(-1.0, 1.0), random(-1.0, 1.0));
					enemy.startPatrolTime = currentTime;
				}

				enemy.position.add(PVector.mult(enemy.velocity, deltaTime * enemy.maxSpeed));

				enemy.rotation = degrees(calculatePlayerRadians(enemy));
				rotate(calculatePlayerRadians(enemy));

			break;

			case isEscaping :
				
				enemy.position.limit(resolutionX);
				enemy.velocity.normalize();
				enemy.position.add(PVector.mult(enemy.velocity, deltaTime * enemy.maxSpeed));
				
				rotate(enemy.position.heading() + radians(-90));

				if(enemy.position.mag() > enemyAttackLimit)
				{
					warpEnemy(enemy);
				}

			break;
		} 
	}

	float calculatePlayerRadians(Enemy enemy)
	{
		float playerRadians = 
		(float)Math.atan2(player.position.x - enemy.position.x,	player.position.y - enemy.position.y) * -1;	

		return playerRadians;
	}

	void warpEnemy(Enemy target)
	{
		enemies.remove(target);
	}

	void destroyEnemy(Enemy target)
	{	
		audioController.stopSound("zapsplat_explosion_big_powerful_internal_002_48731.wav");
		audioController.playSound("zapsplat_explosion_big_powerful_internal_002_48731.wav");
		
		Animation animation =  new Animation(25f, target.position, 0, false);
		Animator.animate(animation, "Explosion");
		enemies.remove(target);
	}
	
	void spawnEnemies()
	{
		if(!hasCreatedEnemies)
		{
			for (int i = 0; i < totalEnemies; ++i) 
			{
				PVector spawnLocation = new PVector(random(-75, 75), random(-75, 75));

				Enemy enemy = new Enemy(
					3, 2, spawnLocation,
					new PVector(0,0),	
					EnemyMode.isFighting);

				Animation animation =  new Animation(100f, spawnLocation, calculatePlayerRadians(enemy), false);
				Animator.animate(animation, "EnemySpawn");

				enemy.spawnAnimation = animation;
				spawningEnemies.add(enemy);
				hasCreatedEnemies = true;
			}

			hasEnemiesSpawned = false;
		}
		else 
		{
			for (int i = 0; i < spawningEnemies.size(); ++i) 
			{
				Enemy enemy = spawningEnemies.get(i);
				if(enemy.spawnAnimation.isDone)
				{
					animatedEnemies.add(enemy);
					spawningEnemies.remove(enemy);
				}
			}

			if(totalEnemies == animatedEnemies.size() && !hasEnemiesSpawned)
			{
				for (Enemy enemy : animatedEnemies) 
				{
					enemies.add(enemy);
				}
				hasEnemiesSpawned = true;
				return;
			}
		}
	}

	void shoot(Enemy enemy)
    {
		float currentTime = millis();		

		if (currentTime - lastShotTime > enemy.fireCooldown)
		{
			//audioController.stopSound("zapsplat_science_fiction_weapon_gun_shoot_003_32196.wav");
			//audioController.playSound("zapsplat_science_fiction_weapon_gun_shoot_003_32196.wav");
			
			projectileController.spawnBullet(enemy.position, 1, BulletType.enemy);
			lastShotTime = currentTime;
		}
    }
}
