class HudController 
{
	float health;
	PFont font;

	HudController() 
	{
		font = createFont("Font/alienleaguebold.ttf", 72);
		textFont(font);
	}

	void update(Player player)
	{
		this.health = player.health;
		draw();
	}                  

	void draw()
	{
		noStroke();
		fill(color(0,0,0,100));
		rect(-resolutionX / 2 + 100, resolutionY / 2 - 180, 260, 100);
		fill(255);
		textAlign(LEFT);
		text("Hp: " + (int)health, -resolutionX / 2 + 120, resolutionY / 2 - 100);
	}
}
