class HudController 
{
	float health;
	float currentWave;
	PFont font;

	HudController() 
	{
		font = createFont("Font/alienleaguebold.ttf", 72);
		textFont(font);
	}

	void update(Player player, float currentWave)
	{
		this.health = player.health;
		this.currentWave = currentWave;
		draw();
	}                  

	void draw()
	{
		drawHealthBar();
		drawCurrentWave();
	}

	void drawHealthBar()
	{
		noStroke();
		fill(color(0,0,0,100));
		rect(-resolutionX / 2 + 100, resolutionY / 2 - 180, 260, 100);
		fill(255);
		textAlign(LEFT);
		text("Hp: " + (int)health, -resolutionX / 2 + 120, resolutionY / 2 - 100);
	}

	void drawCurrentWave()
	{
		fill(color(0,0,0,100));
		rect(-200, resolutionY / 2 - 400,  400, 200);
		fill(255);
		textAlign(CENTER, CENTER);
		text("Wave: " + currentWave, 0, resolutionY / 2 - 350);
	}
	
	
}
