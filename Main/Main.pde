import processing.sound.*;
PApplet mainInstance;

float resolutionScaling = 1;
int resolutionX = int(1920 * resolutionScaling);
int resolutionY = int(1080 * resolutionScaling);

float time;
float oldTime;
float deltaTime;

GameState gameState;

ScreenController screenController;
AssetLoader assetLoader;

void setup() 
{
  surface.setSize(resolutionX, resolutionY);
  surface.setLocation(0, 0);
  surface.setAlwaysOnTop(true);
  fullScreen();
  mainInstance = this;
  assetLoader = new AssetLoader();
  screenController = new ScreenController();
  gameState = GameState.inMainMenu;
  
  imageMode(CENTER);
  frameRate(120);
  assetLoader.loadAnimations();
  assetLoader.loadSprites();
}

void draw() 
{
  
  calculateDeltaTime("START");
  screenController.update();

	calculateDeltaTime("END");
}

void calculateDeltaTime(String interval)
{
  switch (interval)
  {
    case "START":
    time = millis();
    deltaTime = (time - oldTime) * 0.001;

    case "END":
    oldTime = time;
  }
}

void loadAssets()
{

}