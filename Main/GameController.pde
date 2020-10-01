public class GameController  
{
    GameState gameState;
    WaveController waveController;
    PlayerController playerController;
    EnvironmentController environmentController;
    CollisionController collisionController;
    ScoreController scoreController;
    color[] colors;
    PImage background;

    public GameController () 
    {
        environmentController = new EnvironmentController();
        playerController = new PlayerController(environmentController.getRings());
        waveController = new WaveController(playerController.player);
        collisionController = new CollisionController();

        gameState = GameState.isRunning;
        background = loadImage("Space.jpg");
    }

    public void update()
    {
        translate(resolutionX / 2, resolutionY / 2);
        background(background);

        switch (gameState)
        {
            case isRunning:
                environmentController.update();
                playerController.update();
                waveController.update();
                collisionController.update(playerController.player,
                    waveController.currentWave.enemies,
                    playerController.projectileController.projectiles);
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
