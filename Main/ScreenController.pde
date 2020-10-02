class ScreenController 
{
	AudioController audioController;
	Screen currentScreen;
	MainMenu mainMenu;
	PauseMenu pauseMenu;
	Highscore highscore;
	Game game;

	ScreenController() 
	{
		mainMenu = new MainMenu();
		pauseMenu = new PauseMenu();
		highscore = new Highscore();
		game = new Game();

		audioController = new AudioController();
		audioController.loadSound("scott-buckley-signal-to-noise.wav");
		audioController.loopSound("scott-buckley-signal-to-noise.wav");
		audioController.volumeSound("scott-buckley-signal-to-noise.wav", 0.4);
		
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

            case inHighscore:
				currentScreen = highscore;
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
