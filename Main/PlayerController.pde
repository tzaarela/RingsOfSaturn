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
	}
}