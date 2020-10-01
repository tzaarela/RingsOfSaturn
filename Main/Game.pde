class Game implements Screen 
{
	GameController gameController;
	AudioController audioController;
	boolean isStarted;

	public Game() 
	{
		audioController = new AudioController();
		audioController.loadSound("scott-buckley-signal-to-noise.mp3");
		audioController.playSound("scott-buckley-signal-to-noise.mp3");
	}

	void startGame()
	{	
		if(!isStarted)
		{
			gameController = new GameController();
			isStarted = true;
		}
	}

	void update()
	{
		gameController.update();
	}

}
