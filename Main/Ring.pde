public class Ring  
{
    float radius;
    float level;

    public Ring(float level)
    {
        this.level = level;
        create(level);
    }

    void create(float level)
    {
        radius = level * 120;
    }

}