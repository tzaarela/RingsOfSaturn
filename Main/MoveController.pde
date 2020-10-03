public class MoveController  
{

	float angle = 0f;
	float stepTime = 0f;
	Entity entity;

	float velocityLimit = 20f;
	float rotateSpeed = 20f;
	float accelerationMultiplier = 1.1f;
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
		acceleration.x = input.normalize().x;
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

	
	void orbit(PVector input, float degreeXOffset, float degreeYOffset)
	{
		calculateVelocity(input);

		angle += velocity.x * rotateSpeed * deltaTime;
		PVector positionOnRing = new PVector(sin(radians(angle + degreeXOffset)), 
											cos(radians(angle + degreeYOffset))).
											mult(entity.currentRing.radius);
		PVector offset = new PVector(0, 0);
		PVector.add(positionOnRing, offset, entity.position);
		acceleration.set(0, 0);
	}

	boolean teleport(PVector input, Ring[] rings)
	{
		float currentTime = millis();

		if (currentTime - stepTime > ((Player)entity).jumpCooldown)
		{			
			if (input.y < 0 && entity.currentRing.level > 0)
			{	
				entity.currentRing = rings[entity.currentRing.level - 1];
				stepTime = currentTime;
				return true;
			}
					
			else if (input.y > 0 && entity.currentRing.level < rings.length - 1)
			{
				entity.currentRing = rings[entity.currentRing.level + 1];
				stepTime = currentTime;
				return true;
			}		
		}

		return false;
	}

}