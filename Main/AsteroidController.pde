class AstroidController
{
	Astroid astroid;
	MoveController moveController;
	Ring[] rings;
	
	AstroidController(Ring[] rings)
	{
		this.rings = rings;
		PVector velocity = new PVector(1, 1);
		astroid = new Astroid(rings[2], 3, velocity);
		moveController = new MoveController(astroid);
	}

	void update()
	{
		moveController.lineMove(astroid.velocity);
		draw();
	}

	void draw()
	{
		push();
		translate(astroid.position.x, astroid.position.y);
		translate(50, 50);
		image(astroid.sprite, 0, 0);	
		pop();	
	}
}