class Game implements Screen 
{
	GameController gameController;

	public Game() 
	{
		
	}

	void startGame()
	{	
		gameController = new GameController();
		gameState = GameState.inGame;
	}

	void update()
	{
		gameController.update();
	}

}
