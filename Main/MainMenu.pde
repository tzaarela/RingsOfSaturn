class MainMenu implements Screen
{	
	PImage background;
	PFont font;

	public MainMenu () 
	{
		background = loadImage("Menu.png");
		font = createFont("alienleague.ttf", 72);
		textFont(font);
		textAlign(CENTER);
	}

	void update()
	{
		background(background);
		drawMainMenu();

		if(isSpacePressed)
		{
			startGame();
		}
	}

	void drawMainMenu()
	{
		text("START GAME", resolutionX / 2, 500);
		text("HIGH SCORE", resolutionX / 2, 580);
		text("OPTIONS", resolutionX / 2, 660);
		text("EXIT GAME", resolutionX / 2, 740);
	}

	void startGame()
	{
		gameState = GameState.inGame;
	}

	void showHighscore()
	{
		gameState = GameState.inHighscore;
	}

	void options()
	{
		//NotImplemented
	}

	void exitGame()
	{
		exit();
	}
}
