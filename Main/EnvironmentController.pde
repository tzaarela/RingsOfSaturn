class EnvironmentController  
{
    float numberOfRings = 5;
    Ring[] rings;
    color[] colors;

    EnvironmentController () 
    {
        rings = new Ring[5];
        colors = new color[]
        {
            color(69, 76, 83, 50),
            color(47, 50, 52, 50),
            color(57, 59, 61, 50),
            color(38, 40, 43, 50),
            color(27, 29, 31, 50),
        };
        createRings();
    }

    void update()
    {
        draw();
    }

    void draw()
    {
        drawBackgroundCircles();
        drawRings();
    }

    void createRings()
    {
        for (int i = 0; i < rings.length; i++) 
        {
            rings[i] = new Ring(i);            
        }
    }

    void drawRings()
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

    void drawBackgroundCircles()
    {
        for (int i = 4; i >= 0; i--) 
        {
            fill(colors[i]);
            noStroke();
            ellipse(0, 0, (i+1) * 120 , (i+1) * 120);
        }
    }

    
    Ring[] getRings()
    {
        return rings;
    }
}
