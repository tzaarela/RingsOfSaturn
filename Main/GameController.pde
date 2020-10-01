public class GameController  
{
    
    WaveController waveController;
    PlayerController playerController;
    EnvironmentController environmentController;
    CollisionController collisionController;
    ScoreController scoreController;
    ScreenController screenController;
    color[] colors;
    PImage background;

    public GameController() 
    {
        environmentController = new EnvironmentController();
        playerController = new PlayerController(environmentController.getRings());
        waveController = new WaveController(playerController.player);
        collisionController = new CollisionController();
        screenController = new ScreenController();

        background = loadImage("Space.jpg");
    }

    public void update()
    {
        translate(resolutionX / 2, resolutionY / 2);
        background(background);

        environmentController.update();
            playerController.update();
            waveController.update();
            collisionController.update(playerController.player,
                waveController.currentWave.enemies,
                playerController.projectileController.projectiles);
    }
}
