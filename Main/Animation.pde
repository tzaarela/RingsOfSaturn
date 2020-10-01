class Animation  
{
	PVector position;
	boolean isLooped;
	float delay;
	float frameStart;
	float frameEnd;
	int frameIndex;
	ArrayList<PImage> frames;
	PImage frame;

	Animation(float delay, PVector position, boolean isLooped) 
	{
		this.isLooped = isLooped;
		this.delay = delay;
		this.position = position;
	}

	PImage getNextFrame()
	{

		if (frameIndex < frames.size())
		{
			frame = frames.get(frameIndex++);
		}
		else 
		{
			if(!isLooped)
			{
				return null;
			}
			frameIndex = 0;
			frame = frames.get(frameIndex++);
		}

		return frame;
	}

}
