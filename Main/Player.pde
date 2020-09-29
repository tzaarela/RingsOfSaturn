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
        this.size = 40;
    }

    public void shoot()
    {

    }

    public void die()
    {

    }
}
