public class MoveController  
{

	float angle = 0f;
	float rotateSpeed = 300f;
	float stepTime = 0f;
	Entity entity;

	MoveController(Entity entity)
	{
		this.entity = entity;
	}

	
	void lineMove(PVector input)
	{
		angle += input.x * rotateSpeed * deltaTime;
		PVector center = new PVector(0, 0);
		PVector offset = new PVector(sin(radians(angle)), cos(radians(angle))).mult(entity.currentRing.radius);
		PVector.add(center, offset, entity.position);
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