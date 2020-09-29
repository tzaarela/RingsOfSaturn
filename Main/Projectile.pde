public class Projectile extends Entity 
{
    float damage;

    public Projectile (float damage, PVector velocity, PVector position, PImage image) 
    {
        this.position = position;
        this.velocity = velocity;
        this.size = size;
        this.image = image;
        this.damage = damage;
    }

}
