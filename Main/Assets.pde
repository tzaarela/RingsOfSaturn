static class Assets
{
	static HashMap<String, PImage> sprites = new HashMap<String, PImage>();

	static void loadSprites(String spriteName, PImage sprite)
	{
		sprites.put(spriteName, sprite);
	}
}