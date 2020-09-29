public class MoveController  
{

	float angle = 0f;
	float rotateSpeed = 150f;
	float stepTime = 0f;
	Entity entity;

	MoveController(Entity entity)
	{
		this.entity = entity;
	}

	
	void lineMove(PVector input)
	{
		angle += input.x * rotateSpeed * deltaTime;
		//println("Angle: " + angle); 

		PVector center = new PVector(0, 0);
		//println("Center X: " + center.x); 
		//println("Center Y: " + center.y); 

		PVector offset = new PVector(sin(radians(angle)), cos(radians(angle))).mult(entity.currentRing.radius);
		//println("Offset X: " + offset.x); 
		//println("Offset Y: " + offset.y); 

		PVector.add(center, offset, entity.position);
		// println("Entity X: " + entity.position.x); 
		// println("Entity Y: " + entity.position.y); 
	}

	void lineStep(PVector input, Ring[] rings)
	{
		float currentTime = millis();

		//println("Current ring level: " + entity.currentRing.level);
		//println("Input Y: " + input.y);

		if (currentTime - stepTime > ((Player)entity).jumpCooldown)
		{			
			if (input.y < 0 && entity.currentRing.level > 0)
			{	
				println("Step in one ring");
				entity.currentRing = rings[entity.currentRing.level - 1];

				stepTime = currentTime;
			}
					
			else if (input.y > 0 && entity.currentRing.level < rings.length - 1)
			{
				println("Step out one ring");
				entity.currentRing = rings[entity.currentRing.level + 1];

				stepTime = currentTime;
			}
			

		}
	}

}
