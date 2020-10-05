boolean isLeftPressed, isRightPressed, isUpPressed, isDownPressed, isSpacePressed, isEnterPressed, isLeftMousePressed;

void keyPressed()
{
    setInputs(keyCode, true);
}

void keyReleased()
{
    setInputs(keyCode, false);
}

void mousePressed() 
{
  if (mouseButton == LEFT) 
      setInputs(1337, true);
}

void mouseReleased() 
{
  if (mouseButton == LEFT) 
      setInputs(1337, false);
}

PVector getInputVector()
{
    PVector input = new PVector();
    input.x = int(isRightPressed) - int(isLeftPressed);
    input.y = int(isDownPressed) - int(isUpPressed);
    return input;
}

void setInputs(int keyCode, boolean isPressed)
{
    switch (keyCode) 
    {
        case 'A' :
        case 37 :
        isLeftPressed = isPressed;
        break;	

        case 'W' :
        case 38 :
        isUpPressed = isPressed;
        break;

        case 'D' :
        case 39 :
        isRightPressed = isPressed;
        break;		

        case 'S' :
        case 40 :
        isDownPressed = isPressed;
        break;	

        case ' ' :
        isSpacePressed = isPressed;
        break;

        case ENTER :
        isEnterPressed = isPressed;
        break;

        case 1337:
        isLeftMousePressed = isPressed;
        break;
    }
}
