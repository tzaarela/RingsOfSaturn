class MainMenu implements Screen
{	
	PImage background;
	PFont font;
	ArrayList<MenuItem> menuItems;
	float moveTime;
	float moveCooldown;

	public MainMenu () 
	{
		background = loadImage("Menu/Menu.png");
		font = createFont("Font/alienleague.ttf", 72);
		menuItems = createMenuItems();
		moveCooldown = 200;

		textFont(font);
		textAlign(CENTER, CENTER);
	}

	void update()
	{
		background(background);
		drawMenuItems();
		moveSelection();
		pressSelection();  
	}

	void pressSelection()
	{
		if(isSpacePressed)
		{
			MenuItem menuItem = getSelectedMenuItem();
			
			switch (menuItem.text) 
			{
				case "START GAME":
				startGame();
				break;

				case "EXIT GAME":
				exitGame();
				break;
			}
		}
	}

	MenuItem getSelectedMenuItem()
	{
		for (MenuItem menuItem : menuItems) 
		{
			if(menuItem.isSelected)
			{
				return menuItem;
			}
		}
		return null;
	}

	void moveSelection()
	{
		float currentTime = millis();

		if(currentTime - moveTime > moveCooldown)
		{
			if (isUpPressed)
			{
				for (int i = 0; i < menuItems.size(); ++i) 
				{
					if(menuItems.get(i).isSelected)
					{
						menuItems.get(i).isSelected = false;
						menuItems.get(i - 1 == -1 ? 3 : i - 1).isSelected = true;
						break;
					}
				}
				moveTime = currentTime;
			}
			if (isDownPressed)
			{
				for (int i = 0; i < menuItems.size(); ++i) 
				{
					if(menuItems.get(i).isSelected)
					{
						menuItems.get(i).isSelected = false;
						menuItems.get(i + 1 == 4 ? 0 : i + 1).isSelected = true;
						break;
					}
				}
				moveTime = currentTime;
			}
		}
	}

	void drawMenuItems()
	{
		for (MenuItem menuItem : menuItems) 
		{
			menuItem.draw();
		}
	}
 
	ArrayList<MenuItem> createMenuItems()
	{
		ArrayList<MenuItem> items = new ArrayList<MenuItem>();
		items.add(new MenuItem("START GAME", resolutionX / 2, 500));
		items.get(0).isSelected = true;
		items.add(new MenuItem("HIGH SCORE", resolutionX / 2, 580));
		items.add(new MenuItem("OPTIONS", resolutionX / 2, 660));
		items.add(new MenuItem("EXIT GAME", resolutionX / 2, 740));
		return items;
	}

	void startGame()
	{
		gameState = GameState.inGame;
	}

	void showHighscore()
	{
		gameState = GameState.inHighscore;
	}

	void options()
	{
		//NotImplemented
	}

	void exitGame()
	{
		exit();
	}
}
