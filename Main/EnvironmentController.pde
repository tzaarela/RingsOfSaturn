class EnvironmentController  
{
    int numberOfRings = 3;
    Ring[] rings;
    color[] colors;

    EnvironmentController () 
    {
        // #210535
        // #430d4b
        // #7b337d
        // #c874b2

        rings = new Ring[numberOfRings];
        colors = new color[]
        {
            color(#210535),
            color(#430d4b),
            color(#7b337d),
            // color(#c874b2),
        };
        createRings();
    }

    void update()
    {
        draw();
    }

    void draw()
    {
        //drawBackgroundCircles();
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
            // strokeWeight(4);
            stroke(255);
            noStroke();
            noFill();
            ellipse(0, 0, ring.radius * 2, ring.radius * 2);
            pop();
        }
    }

    void drawBackgroundCircles()
    {
        for (int i = 0; i < numberOfRings; i++) 
        {
            noFill();
            // if(i == 0)
            // {
            //     PImage img = loadImage("saturn.png");
            //     imageMode(CENTER);
            //     image(img, 0, 0, (i+1) * 120, (i+1) * 120);
            //     continue;
            // }
            stroke(colors[i % 3]);
            strokeWeight(30);
            ellipse(0, 0, (i+1) * 140 * 2 , (i+1) * 140 * 2);
            stroke(colors[i % 3], 100);
            strokeWeight(60);
            ellipse(0, 0, (i+1) * 140 * 2 , (i+1) * 140 * 2);
            stroke(colors[i % 3], 100);
            strokeWeight(80);
            ellipse(0, 0, (i+1) * 140 * 2 , (i+1) * 140 * 2);


        }
    }
    
    Ring[] getRings()
    {
        return rings;
    }
}
