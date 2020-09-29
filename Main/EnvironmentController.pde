class EnvironmentController  
{
    float numberOfRings = 5;
    Ring[] rings;

    EnvironmentController () 
    {
        rings = new Ring[5];
        createRings();
    }

    void update()
    {
        draw();
    }

    void draw()
    {
        for (Ring ring : rings) 
        {
            push();
            stroke(255);
            noFill();
            ellipse(resolutionX / 2, resolutionY / 2, ring.radius, ring.radius);
            pop();
        }
    }

    void createRings()
    {
        for (int i = 0; i < rings.length; i++) 
        {
            rings[i] = new Ring(i + 1);            
        }
    }

    
    Ring[] getRings()
    {
        return rings;
    }
}
