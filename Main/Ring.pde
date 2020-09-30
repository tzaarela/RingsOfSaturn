public class Ring  
{
    float radius;
    int level;

    public Ring(int level)
    {
        this.level = level;
        create(level);
    }

    void create(int level)
    {
        radius = (level + 1) * 60 * resolutionScaling;
    }

}