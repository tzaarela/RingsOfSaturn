public class MoveController  
{

	float angle = 0f;
	float stepTime = 0f;
	Entity entity;

	float velocityLimit = 20f;
	float rotateSpeed = 20f;
	float accelerationMultiplier = 3.5f;
	float dragMultiplier = 0.15f;

	PVector acceleration;
	PVector drag;
	PVector velocity;

	MoveController(Entity entity)
	{
		this.entity = entity;
		acceleration = new PVector();
		drag = new PVector();
		velocity = new PVector();
	}

	void createAcceleration(PVector input)
	{
		if (input.x > 0)
			acceleration.x -= -input.x;

		if (input.x < 0)
			acceleration.x += input.x;

		acceleration.normalize();
		acceleration.mult(accelerationMultiplier);
	}

	
	void createDrag()
	{
		drag.x = (velocity.x + acceleration.x) * -dragMultiplier;
	}

	void calculateVelocity(PVector input)
	{
		createAcceleration(input);
		createDrag();

		velocity.add(acceleration);
		velocity.add(drag);
		velocity.limit(velocityLimit);
	}

	
	void lineMove(PVector input)
	{
		calculateVelocity(input);

		angle += velocity.x * rotateSpeed * deltaTime;
		PVector center = new PVector(0, 0);
		PVector offset = new PVector(sin(radians(angle)), cos(radians(angle))).mult(entity.currentRing.radius);
		PVector.add(center, offset, entity.position);
		acceleration.set(0, 0);
	}

	void lineStep(PVector input, Ring[] rings)
	{
		float currentTime = millis();

		if (currentTime - stepTime > ((Player)entity).jumpCooldown)
		{			
			if (input.y < 0 && entity.currentRing.level > 0)
			{	
				entity.currentRing = rings[entity.currentRing.level - 1];
				stepTime = currentTime;
			}
					
			else if (input.y > 0 && entity.currentRing.level < rings.length - 1)
			{
				entity.currentRing = rings[entity.currentRing.level + 1];
				stepTime = currentTime;
			}		

		}
	}

}