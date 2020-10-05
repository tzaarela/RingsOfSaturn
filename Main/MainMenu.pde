class MainMenu implements Screen
{	
	PImage background;
	PFont font;
	ArrayList<MenuItem> menuItems;
	float moveTime;
	float moveCooldown;
	AudioController audioController;

	public MainMenu () 
	{
		background = loadImage("Menu/Menu.png");
		font = createFont("Font/alienleague.ttf", 72);
		menuItems = createMenuItems();
		moveCooldown = 200;

		audioController = new AudioController();
		audioController.loadSound("Sound/meny_select.wav");
		audioController.volumeSound("Sound/meny_select.wav", 0.02);

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


	void drawMenuItems()
	{
		for (MenuItem menuItem : menuItems) 
		{
			menuItem.draw();
		}
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
						audioController.playSound("Sound/meny_select.wav");
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
						audioController.playSound("Sound/meny_select.wav");
						menuItems.get(i).isSelected = false;
						menuItems.get(i + 1 == 4 ? 0 : i + 1).isSelected = true;
						break;
					}
				}
				moveTime = currentTime;
			}
		}
	}


	void pressSelection()
	{
		if(isEnterPressed)
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


	ArrayList<MenuItem> createMenuItems()
	{
		PImage highlightSprite = Assets.sprites.get("MenuHighlight");
		ArrayList<MenuItem> items = new ArrayList<MenuItem>();
		items.add(new MenuItem("START GAME", highlightSprite , resolutionX / 2, 500));
		items.get(0).isSelected = true;
		items.add(new MenuItem("HIGH SCORE", highlightSprite, resolutionX / 2, 580));
		items.add(new MenuItem("OPTIONS", highlightSprite, resolutionX / 2, 660));
		items.add(new MenuItem("EXIT GAME", highlightSprite, resolutionX / 2, 740));
		return items;
	}

	void startGame()
	{
		gameState = GameState.newGame;
	}

	void showHighscore()
	{
		gameState = GameState.inGameOver;
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
