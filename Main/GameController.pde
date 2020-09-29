public class GameController  
{
    GameState gameState;
    WaveController waveController;
    PlayerController playerController;
    EnvironmentController environmentController;
    ScoreController scoreController;

    public GameController () 
    {
        environmentController = new EnvironmentController();
        gameState = GameState.isRunning;
    }

    public void update()
    {
        background(0);

        switch (gameState)
        {
            case isRunning:
                environmentController.update();
                //playerController.update();
                //waveController.update();
            break;

            case isPaused:
            break;

            case isVictory:
            break;

            case isDefeat:
            break;
        }


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
