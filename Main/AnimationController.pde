class AnimationController 
{
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

		for (int i = 0; i < animations.size(); ++i) 
		{	
			Animation animation = animations.get(i);
	        animation.frameStart = millis();
			if (animation.frameStart - animation.frameEnd > animation.delay)
			{
				frame = animation.getNextFrame();
				if (frame == null)
				{
					frame = new PImage();
					Animator.stop(animation);
					continue;
				}
				animation.frameEnd = animation.frameStart;
			}
			image(frame, animation.position.x, animation.position.y);
		}
	}
}
