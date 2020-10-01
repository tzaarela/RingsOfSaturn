class Game implements Screen 
{
	GameController gameController;
	boolean isStarted;

	public Game() 
	{
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
