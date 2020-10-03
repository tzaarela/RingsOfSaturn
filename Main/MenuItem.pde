class MenuItem  
{
	String text;
	float x;
	float y;
	boolean isSelected;
	PImage selectedImage;

	MenuItem (String text, float x, float y) 
	{
		this.x = x;
		this.y = y;
		this.text = text;
		selectedImage = loadImage("Menu/MenuHighlight.png");
	}

	void draw()
	{
		if(isSelected)
		{
			push();
				fill(57, 83, 140);
				image(selectedImage, x, y);
			pop();
		}
		text(text, x, y);
	}
}
