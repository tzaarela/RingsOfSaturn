abstract class Entity 
{
    PVector position;
    PVector velocity;
    float size;
    float radius;
    Ring currentRing;
    PImage sprite;

    Entity()
    {
        this.position = new PVector();
        this.velocity = new PVector();
    }

    boolean isColliding(Entity target)
    {
        return false;
    }
}
