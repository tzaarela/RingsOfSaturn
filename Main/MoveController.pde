public class MoveController  
{

	float angle = 0f;
	float rotateSpeed = 1f;
	Entity entity;

	MoveController(Entity entity)
	{
		this.entity = entity;
	}

	
	void lineMove(PVector input)
	{
		angle += input.x * rotateSpeed * deltaTime;
		PVector center = new PVector(resolutionX / 2, resolutionY / 2);
		PVector offset = new PVector(sin(angle), cos(angle)).mult(entity.currentRing.radius);
		PVector.add(center, offset, entity.position);
	}

	void lineStep()
	{

	}

}
