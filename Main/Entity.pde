abstract class Entity 
{
    PVector position;
    PVector velocity;
    PImage sprite;
    float size;
    float radius;
    Ring currentRing;

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
