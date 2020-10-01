abstract class Entity 
{
    PVector position;
    PVector velocity;
    float size;
    float radius;
    Ring currentRing;
    PImage sprite;
    PImage[] deathAnimation;

    Entity()
    {
        this.position = new PVector();
        this.velocity = new PVector();
    }

    boolean isColliding(Entity target)
    {
        float maxDistance = this.size / 2 + target.size / 2;

        if(abs(this.position.x - target.position.x) > maxDistance ||  
            abs(this.position.y - target.position.y) > maxDistance)
        {
            return false;
        }
        
        else if(dist(this.position.x, this.position.y, target.position.x, target.position.y) > maxDistance)
        {
            return false;
        }
        
        return true;
    }
}
