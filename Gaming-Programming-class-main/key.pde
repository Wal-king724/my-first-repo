class Key {
  //variables

  float size;
  float xPos;
  float yPos;
  float xVelo;
  float yVelo;
  //initializations from setup()


  Key(float s) {
    //initializations from setup()
    xPos = random(0, 600);
    yPos = random(300, 600);
    xVelo = 0;
    yVelo = 0;
    size = s;
  }

  void display() {
    //draw()
    xPos += xVelo;
    yPos += yVelo;
    //teleport from right to left
    if (xPos > width || xPos < 0) {
      xVelo = -xVelo;
    }
    //teleport from bottom to top
    if (yPos > height || yPos < 0) {
      yVelo = -yVelo;
    }
    //if (yPos > height/2) {
    //  size= 1;
    //} else {
    //  size= 2;
    //}
   
    //if (xPos >= width-200) {
    //  size = 2;
    //} else {
    //  size = 1;
    //}

    push();
    translate(xPos, yPos);
    scale(size);

    fill(#ffff00);
    rect( -30, -10, 120, 20);
    rect( 20, 10, 10, 20);
    rect( 40, 10, 10, 20);
    rect( 60, 10, 10, 20);
    ellipse( -50, 0, 40, 60);
    rect( 80, 10, 10, 20);
    pop();
  }
}
