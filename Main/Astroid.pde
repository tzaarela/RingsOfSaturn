class Astroid extends Entity
{

	float health;
	
	Astroid (Ring currentRing, PVector velocity) 
	{
		this.currentRing = currentRing;
		this.sprite = Assets.sprites.get("Astroid");
        this.velocity = velocity;
		this.size = 60;
	}
}
