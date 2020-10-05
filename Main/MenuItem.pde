class MenuItem  
{
	String text;
	float x;
	float y;
	float xOffset = -8;
	float yOffset = 3;
	boolean isSelected;
	PImage selectedImage;

	MenuItem (String text, PImage sprite, float x, float y) 
	{
		this.x = x;
		this.y = y;
		this.text = text;
		this.selectedImage = sprite;
	}

	void draw()
	{
		if(isSelected)
		{
				if(selectedImage != null)
				{
					push();
					fill(57, 83, 140);
					image(selectedImage, x + xOffset, y + yOffset);
					pop();
				}
		}
		text(text, x, y);
	}
}
