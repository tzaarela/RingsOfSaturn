float resolutionScaling = 1;
int resolutionX = int(1920 * resolutionScaling);
int resolutionY = int(1080 * resolutionScaling);

float time;
float oldTime;
float deltaTime;

GameState gameState;

ScreenController screenController;

void setup() 
{
  surface.setSize(resolutionX, resolutionY);
  surface.setLocation(0, 0);
  imageMode(CENTER);
  screenController = new ScreenController();
  gameState = GameState.inMainMenu;
  
  frameRate(120);
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
