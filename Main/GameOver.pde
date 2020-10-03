class GameOver implements Screen
{	
	PFont font;
	ArrayList<MenuItem> menuItems;
	float moveTime;
	float moveCooldown;

	public GameOver() 
	{
		font = createFont("Font/alienleague.ttf", 72);
		menuItems = createMenuItems();
		moveCooldown = 200;

		textFont(font);
		textAlign(CENTER, CENTER);
	}

	void update()
	{
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
						menuItems.get(i).isSelected = false;
						menuItems.get(i + 1 == 1 ? 0 : i + 1).isSelected = true;
						break;
					}
				}
				moveTime = currentTime;
			}
		}
	}


	void pressSelection()
	{
		if(isSpacePressed)
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
		items.add(new MenuItem("PLAY AGAIN", resolutionX / 2, 500));
		items.get(0).isSelected = true;
		items.add(new MenuItem("BACK TO MAIN MENU", resolutionX / 2, 580));
		return items;
	}

	void playAgain()
	{
		gameState = GameState.inGame;
	}

	void backToMainMenu()
	{
		gameState = GameState.inMainMenu;
	}

}
