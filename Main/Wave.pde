public class Wave  
{
	int enemyCount;
	float totalEnemies;
	float spawnCount;
	float level;
	ArrayList<Enemy> enemies;
	ArrayList<Enemy> spawningEnemies;
	ArrayList<Enemy> animatedEnemies;
	Player player;
	float enemyAttackLimit = 440;
	float newWaveTimer = 2000;
	float waveEndTimer;
	float attackDirectionX;
	float attackDirectionY;
	AudioController audioController;
	boolean hasEnemiesSpawned;
	boolean hasCreatedEnemies;
	PVector attackDirection;

	

	public Wave(float level, Player player) 
	{
		this.level = level;
		this.player = player;
		this.totalEnemies = level;
		attackDirection = new PVector(random(-1,1), random(-1,1));
		enemies = new ArrayList<Enemy>();
		spawningEnemies = new ArrayList<Enemy>();
		animatedEnemies = new ArrayList<Enemy>();
		audioController = new AudioController();
		audioController.loadSound("zapsplat_explosion_big_powerful_internal_002_48731.wav");
		audioController.volumeSound("zapsplat_explosion_big_powerful_internal_002_48731.wav", 0.075);
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
			enemy.mode = EnemyMode.isSuiciding;
		}

		enemy.velocity.limit(enemy.maxSpeed);

		switch (enemy.mode) 
		{
			case isCircling :

				enemy.position.limit(140);

				if(currentTime - enemy.startPatrolTime > enemy.patrolTime)
				{
					enemy.velocity.add(random(-1.0, 1.0), random(-1.0, 1.0));
					enemy.startPatrolTime = currentTime;
				}

				enemy.position.add(PVector.mult(enemy.velocity, deltaTime * enemy.maxSpeed));

				float playerRadians = (float)Math.atan2(
					player.position.x - enemy.position.x,
					player.position.y - enemy.position.y) * -1;	
				enemy.rotation = degrees(playerRadians);
				rotate(playerRadians);

			break;

			case isSuiciding :
				
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

	void warpEnemy(Enemy target)
	{
		enemies.remove(target);
	}

	void destroyEnemy(Enemy target)
	{	
		audioController.stopSound("zapsplat_explosion_big_powerful_internal_002_48731.wav");
		audioController.playSound("zapsplat_explosion_big_powerful_internal_002_48731.wav");
		
		Animation animation =  new Animation(25f, target.position, false);
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
					6, 2, spawnLocation,
					new PVector(0,0),	
					EnemyMode.isCircling);
				enemy.id = ++enemyCount;

				Animation animation =  new Animation(500f, spawnLocation, false);
				animation.id = enemy.id;
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

			// println(totalEnemies);
			// println(enemies.size());

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
}
