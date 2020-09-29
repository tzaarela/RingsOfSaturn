boolean isLeft, isRight, isUp, isDown;

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
        isLeft = isPressed;
        break;	

        case 'D' :
        isRight = isPressed;
        break;	

        case 'W' :
        isUp = isPressed;
        break;	

        case 'S' :
        isDown = isPressed;
        break;	
    }
}
