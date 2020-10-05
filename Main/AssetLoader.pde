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
		Assets.loadSprites("MenuHighlight", loadImage("Sprites/Menu/MenuHighlight.png"));
		Assets.loadSprites("MenuHighlightBlue", loadImage("Sprites/Menu/MenuHighlightBlue.png"));

	}

	void loadBackground()
	{
		Assets.loadBackground(loadImage("Background/animatedBackground.0001.jpg"));            
		Assets.loadBackground(loadImage("Background/animatedBackground.0002.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0003.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0004.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0005.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0007.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0006.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0008.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0009.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0010.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0011.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0012.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0013.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0014.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0015.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0016.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0017.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0018.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0019.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0020.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0021.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0022.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0023.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0024.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0025.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0026.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0027.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0028.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0028.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0029.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0030.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0031.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0032.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0033.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0034.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0035.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0036.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0037.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0038.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0039.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0041.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0042.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0043.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0044.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0045.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0046.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0047.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0048.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0049.jpg"));
		Assets.loadBackground(loadImage("Background/animatedBackground.0050.jpg"));
	}

	


}
