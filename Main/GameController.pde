public class GameController  
{
    GameState gameState;
    WaveController waveController;
    PlayerController playerController;
    EnvironmentController environmentController;
    ScoreController scoreController;
    color[] colors;

    public GameController () 
    {
        environmentController = new EnvironmentController();
        playerController = new PlayerController(environmentController.getRings());
        gameState = GameState.isRunning;
    }

    public void update()
    {
        translate(resolutionX / 2, resolutionY / 2);
        background(0);
        
        

        switch (gameState)
        {
            case isRunning:
                environmentController.update();
                playerController.update();
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
