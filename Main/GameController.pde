public class GameController  
{
    WaveController waveController;
    PlayerController playerController;
    EnvironmentController environmentController;
    CollisionController collisionController;
    ScoreController scoreController;
    AnimationController animationController;
    AstroidController astroidController;
    HudController hudController;
   
    PImage[] animatedBackground;
    int frame;

    public GameController() 
    {
        environmentController = new EnvironmentController();
        playerController = new PlayerController(environmentController.getRings());
        waveController = new WaveController(playerController.player);
        collisionController = new CollisionController();
        animationController = new AnimationController();
        astroidController = new AstroidController(environmentController.getRings());
        hudController = new HudController();
    }

    public void update()
    {
        translate(resolutionX / 2, resolutionY / 2);

        int spriteCount = Assets.background.size();
        frame = (frame+1) % spriteCount;
        background(Assets.background.get(frame));

        environmentController.update();
        playerController.update();
        animationController.update();
        waveController.update();
        astroidController.update();
        hudController.update(playerController.player,
         waveController.currentWave.level,
         playerController.surviveTime);

        collisionController.update
        (
            playerController.player,
            waveController.currentWave.enemies,
            playerController.projectileController.projectiles,
            waveController.currentWave.projectileController.projectiles,
            astroidController.astroid
        );
    }
}
