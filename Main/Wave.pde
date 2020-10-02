public class Wave  
{
	float totalEnemies;
	float spawnCount;
	float level;
	float velocityMultiplier = 150f;;
	ArrayList<Enemy> enemies;
	Player player;

	public Wave(float level, Player player) 
	{
		this.level = level;
		this.player = player;
		this.totalEnemies = level * 2;
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

		switch (enemy.mode) 
		{
			case isCircling :
				//enemy.position.add(random(-5, 5), random(-5, 5));
				float playerRadians = (float)Math.atan2
				(player.position.x - enemy.position.x, player.position.y - enemy.position.y) * -1;	
				rotate(playerRadians);
			break;

			case isSuiciding :
				enemy.position.add(PVector.mult(enemy.velocity, deltaTime * velocityMultiplier));
				rotate(enemy.position.heading() - radians(90));
			break;
		}
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
			float health = 10;
			float damage = 2;
			
			enemies.add
			(
				new Enemy(health, damage, new PVector(random(-75, 75), random(-75, 75)),
				new PVector(random(-1, 1), random(-1, 1)),
				EnemyMode.isCircling)
			);

			spawnCount++;
			println("Spawn Enemy");
		}
	}

}
