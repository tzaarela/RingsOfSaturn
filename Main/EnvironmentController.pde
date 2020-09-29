public class EnvironmentController  
{
    float numberOfRings = 5;

    Ring[] rings;

    public EnvironmentController () 
    {
        rings = new Ring[5];
        createRings();
    }


    public draw()
    {
        
    }

    void createRings()
    {
        for (int i = 0; i < rings.length; ++i) 
        {
            rings[i] = new Ring(i);
        }
    }

}
