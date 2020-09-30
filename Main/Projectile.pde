class Projectile extends Entity 
{
    float damage;

    Projectile (PVector position, PVector velocity) 
    {
        this.position = position;
        this.velocity = velocity;
        this.size = 5;        
    }

    Projectile (float damage, PVector velocity, PVector position) 
    {
        this.position = position;
        this.velocity = velocity;
        this.size = size;
        this.damage = damage;
    }

}
