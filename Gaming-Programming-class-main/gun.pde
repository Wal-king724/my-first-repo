class Gun {
  //variables


  float xPos;
  float yPos;
  float xVelo;
  float yVelo;
  //initializations from setup()


  Gun(float x, float y) {
    //initializations from setup()
    xPos = x;
    yPos = y;
    xVelo = 0;
    yVelo = 0;
  }

  void display() {
    //draw()
    xPos += xVelo;
    yPos += yVelo;
    ////teleport from right to left
    //if (xPos > width) {
    //  xPos = 0;
    //}
    //teleport from bottom to top
    //if (yPos > height) {
    // xPos = random(0, 800);
    //yPos = random(-400, 0);
    //}
    push();
    translate(xPos, yPos);


    fill(#C1C1BF);
    rect( -50, -10, 80, 20);
    fill(#1A0D0B);
    rect( 0, 10, 5, 20);
    fill(#A79997);
    rect( -20, 10, 10, 10);
    fill(#1A0D0B);
    rect( -20, 25, 25, 5);
    fill(#1A0D0B);
    rect( -40, 10, 20, 40);
    fill(#D3CFC6);
    rect( 20, -10, 10, 20);
    pop();
  }
}
