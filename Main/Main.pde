int resolutionX = 1920;
int resolutionY = 1080;

float time;
float oldTime;
float deltaTime;

GameController gameController;

void setup() 
{
  surface.setSize(resolutionX, resolutionY);
  surface.setLocation(0, 0);
  gameController = new GameController();
  frameRate(300);
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