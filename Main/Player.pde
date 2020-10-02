class Player extends Entity 
{
    float fireCooldown;
    float health;
    float maxSpeed;
    float ammoLimit;
    float bulletSpeed;
    float damage;
    float jumpCooldown;

    Powerup currentPowerup;


    Player (Ring currentRing) 
    {
        this.currentRing = currentRing;
        this.size = 40;
        this.jumpCooldown = 250;
        this.fireCooldown = 125;
        sprite = loadImage("PlayerRevamped.png");
    }

}