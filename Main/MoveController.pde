public class MoveController  
{
    float velocityLimit = 20f;
	float velocityMultiplier = 75f;
	float accelerationMultiplier = 3f;
	float dragMultiplier = 0.1f;

	PVector acceleration = new PVector();
	PVector drag = new PVector();
	PVector velocity = new PVector();

	PVector getAcceleration()
	{
        PVector inputVector = getInputVector();
		inputVector.normalize();
		return inputVector.copy().mult(accelerationMultiplier);
	}

	PVector drag()
	{
		PVector drag = new PVector();

		drag.x = (velocity.x + acceleration.x) * -dragMultiplier;
		drag.y = (velocity.y + acceleration.y) * -dragMultiplier;

		return drag;
	}

	void calculateMove(Entity object)
	{
		acceleration = getAcceleration();
		drag = drag();
	}

	void move(Entity object, ForceType forceType)
	{   
		switch(forceType)
		{
			case CONSTANT:
			object.position.add(PVector.mult(object.velocity, deltaTime * velocityMultiplier));
			break;
		}
	}
}


enum ForceType
{
	CONSTANT;
}