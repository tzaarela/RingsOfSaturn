int resolutionX = 1280;
int resolutionY = 720;

float time;
float oldTime;
float deltaTime;

GameController gameController;

void setup() 
{
	surface.setSize(resolutionX, resolutionY);
	surface.setLocation(0, 0);

	gameController = new GameController();
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