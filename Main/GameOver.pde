class GameOver implements Screen
{	
	PFont font;
	ArrayList<MenuItem> menuItems;
	float moveTime;
	float moveCooldown;
	Highscore highscore;
	int frame;
	AudioController audioController;

	public GameOver() 
	{
		font = createFont("Font/alienleague.ttf", 72);
		menuItems = createMenuItems();
		moveCooldown = 200;
		highscore = new Highscore();

		audioController = new AudioController();
		audioController.loadSound("Sound/meny_select.wav");
		audioController.volumeSound("Sound/meny_select.wav", 0.04);

		textFont(font);
		textAlign(CENTER, CENTER);
	}

	void update()
	{
		translate(resolutionX / 2, resolutionY / 2);

		int spriteCount = Assets.background.size();
        frame = (frame+1) % spriteCount;
        background(Assets.background.get(frame));

		highscore.draw();

		textAlign(CENTER,CENTER);
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
						menuItems.get(i - 1 == -1 ? 1 : i - 1).isSelected = true;
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
						menuItems.get(i + 1 == 2 ? 0 : i + 1).isSelected = true;
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
				case "PLAY AGAIN":
				playAgain();
				break;

				case "BACK TO MAIN MENU":
				backToMainMenu();
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
		ArrayList<MenuItem> items = new ArrayList<MenuItem>();
		items.add(new MenuItem("PLAY AGAIN", 0, 300));
		items.get(0).isSelected = true;
		items.add(new MenuItem("BACK TO MAIN MENU", 0, 380));
		return items;
	}

	void playAgain()
	{
		gameState = GameState.newGame;
	}

	void backToMainMenu()
	{
		gameState = GameState.inMainMenu;
	}

}
