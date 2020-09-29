class Player extends Entity 
{
    float health;
    float maxSpeed;
    float ammoLimit;
    float bulletSpeed;
    float damage;
    float jumpCooldown;

    Powerup currentPowerup;
    MoveController moveController;

    Player (Ring currentRing) 
    {
        this.currentRing = currentRing;
        this.size = 40;
        this.jumpCooldown = 250;
    }

    void shoot()
    {
        if (isFiring)
        {
            PVector direction = PVector.mult(this.position, -1);
            Projectile projectile = new Projectile(direction);

            ellipse(projectile.position.x, projectile.position.y, projectile.size, projectile.size);
        }
    }

    void die()
    {

    }
}
