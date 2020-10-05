class AstroidController
{
	Astroid astroid;
	MoveController moveController;
	Ring[] rings;
	float xRotation;
	float yRotation;
	
	AstroidController(Ring[] rings)
	{
		this.rings = rings;
		PVector velocity = new PVector(1, 1);
		astroid = new Astroid(rings[2], velocity);
		moveController = new MoveController(astroid);

		xRotation = random(50, 150);
		yRotation = random(xRotation, 170);
	}

	void update()
	{
		moveController.orbit(astroid.velocity, xRotation, yRotation);
		draw();
	}

	void draw()
	{
		push();
		translate(astroid.position.x, astroid.position.y);
		image(astroid.sprite, 0, 0);	
		pop();	
	}
	
}