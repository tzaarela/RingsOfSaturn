abstract class Entity 
{
    PVector position;
    PVector velocity;
    PImage sprite;
    float size;
    float radius;
    Ring currentRing;

    boolean isColliding(Entity target)
    {
        return false;
    }
}
