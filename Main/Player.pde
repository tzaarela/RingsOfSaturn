public class Player extends Entity 
{
    float health;
    float maxSpeed;
    float ammoLimit;
    float bulletSpeed;
    float damage;

    Powerup currentPowerup;
    MoveController moveController;

    public Player (Ring currentRing) 
    {
        this.currentRing = currentRing;
    }

    public void shoot()
    {

    }

    public void die()
    {

    }
}
