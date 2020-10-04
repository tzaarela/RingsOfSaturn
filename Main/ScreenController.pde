class ScreenController 
{
	AudioController audioController;
	Screen currentScreen;
	MainMenu mainMenu;
	PauseMenu pauseMenu;
	Highscore highscore;
	Game game;
	GameOver gameOver;

	ScreenController() 
	{
		mainMenu = new MainMenu();
		pauseMenu = new PauseMenu();
		gameOver = new GameOver();
		game = new Game();

		audioController = new AudioController();
		audioController.loadSound("Sound/scott-buckley-signal-to-noise.wav");
		audioController.loopSound("Sound/scott-buckley-signal-to-noise.wav");
		audioController.volumeSound("Sound/scott-buckley-signal-to-noise.wav", 0.04);
		
		currentScreen = mainMenu;
	}

	void update()
	{
		switch (gameState)
        {
            case inGame:
                currentScreen = game;
				game.startGame();
            break;

            case inMainMenu:
				currentScreen = mainMenu;
            break;

            case inPauseMenu:
				currentScreen = pauseMenu;
            break;

            case inGameOver:
				currentScreen = gameOver;
            break;
        }

		displayScreen();
	}

	void displayScreen()
	{
		currentScreen.update();
	}

	Screen showMainMenu()
	{
		return mainMenu;
	}

}
