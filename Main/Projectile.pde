public class Projectile extends Entity 
{
    float damage;

    public Projectile (PVector position) 
    {
        this.position = position;
        this.size = 20;
    }

    public Projectile (float damage, PVector velocity, PVector position, PImage sprite) 
    {
        this.position = position;
        this.velocity = velocity;
        this.size = size;
        this.sprite = sprite;
        this.damage = damage;
    }

}
