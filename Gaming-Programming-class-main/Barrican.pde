class Stone {
  //variables

  float size;
  float xPos;
  float yPos;
  float xVelo;
  float yVelo;
  boolean used;
  //initializations from setup()


  Stone(float s) {
    //initializations from setup()
    xPos = random(0, 500);
    yPos = random(300, 500);
    xVelo = 0;
    yVelo = 0;
    size = s;
    used = false;
  }

  void display() {
    //draw()
    xPos += xVelo;
    yPos += yVelo;
    
    ////teleport from right to left
    //if (xPos > width || xPos < 0) {
    //  xVelo = -xVelo;
    //}
    ////teleport from bottom to top
    //if (yPos > height || yPos < 0) {
    //  yVelo = -yVelo;
    //}
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
    fill(#6F5D5D);
    rect( -100, -10, 150, 20);
    fill(#645050);
    rect( -100, 10, 10, 20);
    fill(#645050);
    rect( 40, 10, 10, 20);
   fill(#8B7575);
    triangle( -99, -10, -30, -40, 49, -10);
    //ellipse( -50, 0, 40, 60);
    //rect( 80, 10, 10, 20);
    pop();
  }
}
