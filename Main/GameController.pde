public class GameController  
{
    GameState gameState;
    WaveController waveController;
    PlayerController playerController;
    EnvironmentController environmentController;
    ScoreController scoreController;


    public GameController () 
    {
        player = new Player();
        environmentController = new EnvironmentController();
        
    }

    public void update()
    {
        switch (gameState)
        {

        }

        environmentController.update();
        playerController.update();
        waveController.update();
    }
    
    public void startGame()
    {
        gameState = gameState.isRunning;
    }

    public void pauseGame()
    {

    }

    public void mainMenu()
    {

    }
}
