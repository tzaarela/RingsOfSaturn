class PlayerController
{
	Player player;
	Ring[] rings;
	MoveController moveController;


	PlayerController(Ring[] rings)
	{
		player = new Player(rings[rings.length - 1]);
		moveController = new MoveController(player);
		this.rings = rings;
	}

	void update()
	{
		moveController.lineMove(getInputVector());
		moveController.lineStep(getInputVector(), rings);
		player.shoot();
		draw();
	}

	void draw()
	{
		push();
		fill(255);
		ellipse(player.position.x, player.position.y, player.size, player.size);
		pop();
	}
}