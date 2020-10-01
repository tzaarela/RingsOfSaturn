static class Animator
{
	static HashMap<String, ArrayList<PImage>> frames = new HashMap<String, ArrayList<PImage>>();
	static ArrayList<Animation> animations  = new ArrayList<Animation>();

	static void loadFrames(String groupName, ArrayList<PImage> frames)
	{
		Animator.frames.put(groupName, frames);
	}

	static void animate(Animation animation, String groupName)
	{
		animation.frames = frames.get(groupName);
		animations.add(animation);
	}

	static void stop(Animation animation)
	{
		animations.remove(animation);
	}
}
