class AssetLoader 
{
	void loadAnimations()
	{
		//Explosion
		ArrayList<PImage> images = new ArrayList<PImage>();
		images.add(loadImage("Explosion00.png"));
		images.add(loadImage("Explosion01.png"));
		images.add(loadImage("Explosion02.png"));
		images.add(loadImage("Explosion03.png"));
		images.add(loadImage("Explosion04.png"));
		Animator.loadFrames("Explosion", images);
	}
}
