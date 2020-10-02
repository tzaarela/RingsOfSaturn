class AssetLoader 
{
	void loadAnimations()
	{
		//Explosion
		ArrayList<PImage> explosions = new ArrayList<PImage>();
		explosions.add(loadImage("Explosion00.png"));
		explosions.add(loadImage("Explosion01.png"));
		explosions.add(loadImage("Explosion02.png"));
		explosions.add(loadImage("Explosion03.png"));
		explosions.add(loadImage("Explosion04.png"));
		explosions.add(loadImage("Explosion05.png"));
		explosions.add(loadImage("Explosion06.png"));
		Animator.loadFrames("Explosion", explosions);

		//Enemy Spawns
		ArrayList<PImage> enemySpawn = new ArrayList<PImage>();
		enemySpawn.add(loadImage("EnemySpawn00.png"));
		enemySpawn.add(loadImage("EnemySpawn01.png"));
		enemySpawn.add(loadImage("EnemySpawn02.png"));
		enemySpawn.add(loadImage("EnemySpawn03.png"));
		enemySpawn.add(loadImage("EnemySpawn04.png"));
		enemySpawn.add(loadImage("EnemySpawn05.png"));
		enemySpawn.add(loadImage("EnemySpawn06.png"));
		enemySpawn.add(loadImage("EnemySpawn07.png"));
		Animator.loadFrames("EnemySpawn", enemySpawn);
	}
}
