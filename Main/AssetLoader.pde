class AssetLoader 
{
	void loadAnimations()
	{
		//Explosion
		ArrayList<PImage> explosions = new ArrayList<PImage>();
		explosions.add(loadImage("Sprites/Explosion00.png"));
		explosions.add(loadImage("Sprites/Explosion01.png"));
		explosions.add(loadImage("Sprites/Explosion02.png"));
		explosions.add(loadImage("Sprites/Explosion03.png"));
		explosions.add(loadImage("Sprites/Explosion04.png"));
		explosions.add(loadImage("Sprites/Explosion05.png"));
		explosions.add(loadImage("Sprites/Explosion06.png"));
		Animator.loadFrames("Explosion", explosions);
 
		//Enemy Spawns
		ArrayList<PImage> enemySpawn = new ArrayList<PImage>();
		enemySpawn.add(loadImage("Sprites/EnemySpawn00.png"));
		enemySpawn.add(loadImage("Sprites/EnemySpawn01.png"));
		enemySpawn.add(loadImage("Sprites/EnemySpawn02.png"));
		enemySpawn.add(loadImage("Sprites/EnemySpawn03.png"));
		enemySpawn.add(loadImage("Sprites/EnemySpawn04.png"));
		enemySpawn.add(loadImage("Sprites/EnemySpawn05.png"));
		enemySpawn.add(loadImage("Sprites/EnemySpawn06.png"));
		Animator.loadFrames("EnemySpawn", enemySpawn);
	}

	void loadSprites()
	{
		Assets.loadSprites("Enemy", loadImage("Sprites/Enemy00.png"));
		Assets.loadSprites("Astroid", loadImage("Sprites/Astroid.png"));
		Assets.loadSprites("Player", loadImage("Sprites/PlayerRevampedTurquoise.png"));
	}


}
