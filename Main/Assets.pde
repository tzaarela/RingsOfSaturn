static class Assets
{
	static HashMap<String, PImage> sprites = new HashMap<String, PImage>();
	static ArrayList<PImage> background = new ArrayList<PImage>();

	static void loadSprites(String spriteName, PImage sprite)
	{
		sprites.put(spriteName, sprite);
	}

	static void loadBackground(PImage backgroundImage)
	{
		background.add(backgroundImage);
	}
}