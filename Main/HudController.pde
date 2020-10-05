class HudController 
{
	float health;
	float currentWave;
	float aliveTime;
	PFont font;

	HudController() 
	{
		font = createFont("Font/alienleaguebold.ttf", 72);
		textFont(font);
	}

	void update(Player player, float currentWave, float aliveTime)
	{
		this.health = player.health;
		this.currentWave = currentWave;
		this.aliveTime = aliveTime;
		draw();
	}                  

	void draw()
	{
		drawHealthBar();
		drawCurrentWave();
		drawCrosshair();
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
		rect(-900, -500,  420, 200);
		fill(255);
		textAlign(CENTER, CENTER);
		text("Wave: " + (int)currentWave, -700,  -450);
		text("Time Alive: " + (int)aliveTime, -700,  -370);

	}

	void drawCrosshair()
	{
		push();
		translate(-resolutionX / 2, -resolutionY / 2);
		noCursor();
		image(Assets.sprites.get("Crosshair"), mouseX, mouseY, 48, 49);
		pop();
	}
	
	
}
