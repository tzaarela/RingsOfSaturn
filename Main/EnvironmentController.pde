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
            ellipse(0, 0, ring.radius * 2, ring.radius * 2);
            pop();
        }
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
