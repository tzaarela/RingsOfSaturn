class AstroidController
{
	Astroid astroid;
	MoveController moveController;
	Ring[] rings;
	
	AstroidController(Ring[] rings)
	{
		this.rings = rings;
		PVector velocity = new PVector(1, 1);
		astroid = new Astroid(rings[2], velocity);
		moveController = new MoveController(astroid);
	}

	void update()
	{
		moveController.orbit(astroid.velocity, 85, 100);
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