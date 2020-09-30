class Projectile extends Entity 
{
    float damage;
    boolean isDestroyed;

    Projectile (PVector position, PVector velocity) 
    {
        this.position = position;
        this.velocity = velocity;
        this.size = 1; 
        this.damage = 2;       
    }
}
