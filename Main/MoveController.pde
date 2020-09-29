public class MoveController  
{

	float angle = 0f;
	float rotateSpeed = 100f;
	Entity entity;

	MoveController(Entity entity)
	{
		this.entity = entity;
	}

	
	void lineMove(PVector input)
	{
		angle += input.x * rotateSpeed * deltaTime;
		println("Angle: " + angle); 

		PVector center = new PVector(resolutionX / 2, resolutionY / 2);
		println("Center X: " + center.x); 
		println("Center Y: " + center.y); 

		PVector offset = new PVector(sin(radians(angle)), cos(radians(angle))).mult(entity.currentRing.radius);
		println("Offset X: " + offset.x); 
		println("Offset Y: " + offset.y); 

		PVector.add(center, offset, entity.position);
		println("Entity X: " + entity.position.x); 
		println("Entity Y: " + entity.position.y); 
	}

	void lineStep()
	{

	}

}
