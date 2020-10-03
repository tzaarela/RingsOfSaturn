public class GameController  
{
    
    WaveController waveController;
    PlayerController playerController;
    EnvironmentController environmentController;
    CollisionController collisionController;
    ScoreController scoreController;
    AnimationController animationController;
    AstroidController astroidController;

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
        loadBackground();

    }

    public void update()
    {
        translate(resolutionX / 2, resolutionY / 2);

        int spriteCount = animatedBackground.length;
        frame = (frame+1) % spriteCount;
        background(animatedBackground[frame]);

        environmentController.update();
        playerController.update();
        animationController.update();
        waveController.update();
        astroidController.update();
        collisionController.update
        (
            playerController.player,
            waveController.currentWave.enemies,
            playerController.projectileController.projectiles,
            astroidController.astroid
        );
    }

    void loadBackground()
    {
        animatedBackground = new PImage[]
        {
            loadImage("Background/animatedBackground.0001.jpg"),
            loadImage("Background/animatedBackground.0002.jpg"),
            loadImage("Background/animatedBackground.0003.jpg"),
            loadImage("Background/animatedBackground.0004.jpg"),
            loadImage("Background/animatedBackground.0005.jpg"),
            loadImage("Background/animatedBackground.0007.jpg"),
            loadImage("Background/animatedBackground.0006.jpg"),
            loadImage("Background/animatedBackground.0008.jpg"),
            loadImage("Background/animatedBackground.0009.jpg"),
            loadImage("Background/animatedBackground.0010.jpg"),
            loadImage("Background/animatedBackground.0011.jpg"),
            loadImage("Background/animatedBackground.0012.jpg"),
            loadImage("Background/animatedBackground.0013.jpg"),
            loadImage("Background/animatedBackground.0014.jpg"),
            loadImage("Background/animatedBackground.0015.jpg"),
            loadImage("Background/animatedBackground.0016.jpg"),
            loadImage("Background/animatedBackground.0017.jpg"),
            loadImage("Background/animatedBackground.0018.jpg"),
            loadImage("Background/animatedBackground.0019.jpg"),
            loadImage("Background/animatedBackground.0020.jpg"),
            loadImage("Background/animatedBackground.0021.jpg"),
            loadImage("Background/animatedBackground.0022.jpg"),
            loadImage("Background/animatedBackground.0023.jpg"),
            loadImage("Background/animatedBackground.0024.jpg"),
            loadImage("Background/animatedBackground.0025.jpg"),
            loadImage("Background/animatedBackground.0026.jpg"),
            loadImage("Background/animatedBackground.0027.jpg"),
            loadImage("Background/animatedBackground.0028.jpg"),
            loadImage("Background/animatedBackground.0028.jpg"),
            loadImage("Background/animatedBackground.0029.jpg"),
            loadImage("Background/animatedBackground.0030.jpg"),
            loadImage("Background/animatedBackground.0031.jpg"),
            loadImage("Background/animatedBackground.0032.jpg"),
            loadImage("Background/animatedBackground.0033.jpg"),
            loadImage("Background/animatedBackground.0034.jpg"),
            loadImage("Background/animatedBackground.0035.jpg"),
            loadImage("Background/animatedBackground.0036.jpg"),
            loadImage("Background/animatedBackground.0037.jpg"),
            loadImage("Background/animatedBackground.0038.jpg"),
            loadImage("Background/animatedBackground.0039.jpg"),
            loadImage("Background/animatedBackground.0041.jpg"),
            loadImage("Background/animatedBackground.0042.jpg"),
            loadImage("Background/animatedBackground.0043.jpg"),
            loadImage("Background/animatedBackground.0044.jpg"),
            loadImage("Background/animatedBackground.0045.jpg"),
            loadImage("Background/animatedBackground.0046.jpg"),
            loadImage("Background/animatedBackground.0047.jpg"),
            loadImage("Background/animatedBackground.0048.jpg"),
            loadImage("Background/animatedBackground.0049.jpg"),
            loadImage("Background/animatedBackground.0050.jpg"),
        };
    }
}
