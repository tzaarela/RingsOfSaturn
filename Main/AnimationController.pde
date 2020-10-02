class AnimationController 
{
	float counter;
	PImage frame = new PImage();
	AnimationController() 
	{
		
	}

	void update()
	{
		drawAnimations();
	}

	void drawAnimations()
	{
		ArrayList<Animation> animations = Animator.animations;
		boolean allDone = false;

		for (int i = 0; i < animations.size(); ++i) 
		{	
			Animation animation = animations.get(i);
	        animation.frameStart = millis();

			if (animation.frameStart - animation.frameEnd > animation.delay)
			{
				frame = animation.getNextFrame();
				if (frame == null)
				{
					frame = animation.getPreviousFrame();
					animation.isDone = true;
					animation.frameEnd = animation.frameStart;
					continue;
				}

				animation.frameEnd = animation.frameStart;
			}
			if(frame != null)
			{
				image(frame, animation.position.x, animation.position.y);
			}
		}

		for (Animation animation : animations) 
		{
			if (!animation.isDone)
			{
				allDone = false;
				break;
			}
			allDone = true;
		}
		if(allDone)
		{
			for (int i = 0; i < animations.size(); ++i) 
			{
				Animation animation = animations.get(i);
				Animator.stop(animation);
			}
		}
	}
}
