class EnvironmentController  
{
    int numberOfRings = 3;
    Ring[] rings;
    color[] colors;

    EnvironmentController () 
    {
        rings = new Ring[numberOfRings];
        createRings();
    }

    void update()
    {
        draw();
    }

    void draw()
    {

    }

    void createRings()
    {
        for (int i = 0; i < rings.length; i++) 
        {
            rings[i] = new Ring(i);            
        }
    }
    
    Ring[] getRings()
    {
        return rings;
    }
}
