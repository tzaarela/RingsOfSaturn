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

		//Player Teleport
		ArrayList<PImage> playerTeleport = new ArrayList<PImage>();
		playerTeleport.add(loadImage("Sprites/PlayerTeleport07.png"));
		playerTeleport.add(loadImage("Sprites/PlayerTeleport06.png"));
		playerTeleport.add(loadImage("Sprites/PlayerTeleport05.png"));
		playerTeleport.add(loadImage("Sprites/PlayerTeleport04.png"));
		playerTeleport.add(loadImage("Sprites/PlayerTeleport03.png"));
		playerTeleport.add(loadImage("Sprites/PlayerTeleport02.png"));
		playerTeleport.add(loadImage("Sprites/PlayerTeleport01.png"));
		playerTeleport.add(loadImage("Sprites/PlayerTeleport00.png"));
		Animator.loadFrames("PlayerTeleport", playerTeleport);
	}

	void loadSprites()
	{
		Assets.loadSprites("Enemy", loadImage("Sprites/Enemy00.png"));
		Assets.loadSprites("Astroid", loadImage("Sprites/Astroid.png"));
		Assets.loadSprites("Player", loadImage("Sprites/PlayerShip.png"));
		Assets.loadSprites("PlayerTurnLeft", loadImage("Sprites/PlayerTurnLeft.png"));
		Assets.loadSprites("PlayerTurnRight", loadImage("Sprites/PlayerTurnRight.png"));
		Assets.loadSprites("Crosshair", loadImage("Sprites/Crosshair.png"));
		Assets.loadSprites("MenuHighlight", loadImage("Menu/MenuHighlight.png"));
		Assets.loadSprites("MenuHighlightBlue", loadImage("Menu/MenuHighlightBlue.png"));
	}

	void loadBackground()
	{
		for (int i = 1; i <= 50; i++) 
		{
			String paddedNumber = String.format("%04d", i);
			Assets.loadBackground(loadImage("Background/animatedBackground." + paddedNumber + ".jpg"));   
		}         
	}
}
