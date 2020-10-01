class Animation  
{
	PVector position;
	float delay;
	float frameStart;
	float frameEnd;
	int frameIndex;
	ArrayList<PImage> frames;

	Animation(float delay, PVector position) 
	{
		this.frames = frames;
		this.delay = delay;
		this.position = position;
	}

	PImage getNextFrame()
	{
		PImage frame;

		if (frameIndex < frames.size())
		{
			frame = frames.get(frameIndex++);
		}
		else 
		{
			frameIndex = 0;
			frame = frames.get(frameIndex++);
		}

		return frame;
	}

}
