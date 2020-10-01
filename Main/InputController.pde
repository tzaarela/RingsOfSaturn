boolean isLeft, isRight, isUp, isDown, isFiring;

void keyPressed()
{
    setInputs(keyCode, true);
}

void keyReleased()
{
    setInputs(keyCode, false);
}

PVector getInputVector()
{
    PVector input = new PVector();
    input.x = int(isRight) - int(isLeft);
    input.y = int(isDown) - int(isUp);
    return input;
}

void setInputs(int keyCode, boolean isPressed)
{
    switch (keyCode) {

        case 'A' :
        case 37 :
        isLeft = isPressed;
        break;	

        case 'W' :
        case 38 :
        isUp = isPressed;
        break;

        case 'D' :
        case 39 :
        isRight = isPressed;
        break;		

        case 'S' :
        case 40 :
        isDown = isPressed;
        break;	

        case ' ' :
        isFiring = isPressed;
        break;	
    }
}
