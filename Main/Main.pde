float resolutionScaling = 1.5;
int resolutionX = int(1280 * resolutionScaling);
int resolutionY = int(720 * resolutionScaling);

float time;
float oldTime;
float deltaTime;

GameController gameController;

void setup() 
{
  surface.setSize(resolutionX, resolutionY);
  surface.setLocation(0, 0);
  imageMode(CENTER);
  gameController = new GameController();
  
  frameRate(120);
}

void draw() 
{
  
  calculateDeltaTime("START");

  gameController.update();

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
