public class Wave  
{
	float totalEnemies;
	float spawnCount;
	float level;
	ArrayList<Enemy> enemies;
	Player player;
	float enemyAttackLimit = 440;
	float newWaveTimer = 2000;
	float waveEndTimer;
	float attackDirectionX;
	float attackDirectionY;
	PVector attackDirection;

	

	public Wave(float level, Player player) 
	{
		this.level = level;
		this.player = player;
		this.totalEnemies = level * 2;
		attackDirection = new PVector(random(-1,1), random(-1,1));
		enemies = new ArrayList<Enemy>();
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
		image(enemy.sprite, 0, 0, enemy.size, enemy.size);
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
					enemy.velocity.add(random(-1, 1), random(-1, 1));
					enemy.startPatrolTime = currentTime;
				}

				enemy.position.add(PVector.mult(enemy.velocity, deltaTime * enemy.maxSpeed));

				float playerRadians = (float)Math.atan2(
					player.position.x - enemy.position.x,
					player.position.y - enemy.position.y) * -1;	
				rotate(playerRadians);

			break;

			case isSuiciding :
				
				enemy.position.limit(resolutionX);
				attackDirection.normalize();
				enemy.velocity = new PVector(attackDirection.x, attackDirection.y);
				enemy.position.add(PVector.mult(enemy.velocity, deltaTime * enemy.maxSpeed));

				float rotationSpeed = 3;

				//TODO - Better rotation
				float rotationSpeed = radians(10);
				float rotationGoal = (float)Math.atan2(enemy.velocity.y, enemy.velocity.x) + radians(-90);
				rotate(rotationGoal);
				
				// rotate(enemy.position.heading());

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
		Animation animation =  new Animation(25f, target.position, false);
		Animator.animate(animation, "Explosion");
		enemies.remove(target);
	}
	
	void spawnEnemy()
	{
		if (spawnCount < totalEnemies)
		{
			float health = 6;
			float damage = 2;
			
			enemies.add
			(
				new Enemy(health, damage, new PVector(random(-75, 75), random(-75, 75)),
				new PVector(0,0),
				EnemyMode.isCircling)
			);

			spawnCount++;
			println("Spawn Enemy");
		}
	}

}
