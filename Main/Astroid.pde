class Astroid extends Entity
{

	float health;
	
	Astroid (Ring currentRing, float health, PVector velocity) 
	{
		this.currentRing = currentRing;
		this.sprite = Assets.sprites.get("Astroid");
		this.health = health;
        this.velocity = velocity;
	}
}
