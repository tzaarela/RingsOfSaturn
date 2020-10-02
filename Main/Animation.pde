class Animation  
{
	int id;
	PVector position;
	boolean isLooped;
	float delay;
	float frameStart;
	float frameEnd;
	int frameIndex;
	ArrayList<PImage> frames;
	boolean isDone;
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

	PImage getPreviousFrame()
	{
		if (frameIndex == 0)
		{
			frameIndex = frames.size();
			frame = frames.get(--frameIndex);
		}
		else 
		{
			if(!isLooped)
			{
				return null;
			}
			frame = frames.get(--frameIndex);
		}

		return frame;
	}

}
