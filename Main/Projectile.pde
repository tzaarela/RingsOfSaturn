class Projectile extends Entity 
{
    float damage;

    Projectile (PVector position, PVector velocity) 
    {
        this.position = position;
        this.velocity = velocity;
        this.size = 10;        
    }

    Projectile (float damage, PVector velocity, PVector position, PImage sprite) 
    {
        this.position = position;
        this.velocity = velocity;
        this.size = size;
        this.sprite = sprite;
        this.damage = damage;
    }

}
