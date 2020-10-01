class AnimationController 
{
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

		for (Animation animation : animations) 
		{
	        animation.frameStart = millis();
			if (animation.frameStart - animation.frameEnd > animation.delay)
			{
				PImage frame = animation.getNextFrame();
				image(frame, animation.position.x, animation.position.y);
				animation.frameEnd = animation.frameStart;
			}
		}
	}
}
