class Explosives {
  //variables


  float xPos;
  float yPos;
  float xVelo;
  float yVelo;

  //initializations from setup()


  Explosives() {
    //initializations from setup()

    xPos = random(0, 1400);
    yPos = random(-100, 0);
    xVelo = 0;
    yVelo = 5;
  }

  void display() {
    //draw()
    xPos += xVelo;
    yPos += yVelo;
  
    //teleport from right to left
    //if (xPos > width) {
    //  xPos = 0;
    //}
   
   //teleport from bottom to top
    if (yPos > height) {
      xPos = random(0, 1400);
      yPos = random(-400, 0);
    }
    push();
    translate(xPos, yPos);
    
    fill(#816F6F);
    ellipse( 0, 0, 80, 80);
    fill(#050404);
    rect( 30, -10, -60, 20, 30);
    fill(#FFFFFF);
   textSize(15);
    text(  "BOMB", -25, 3 );
     
    fill(#F5CD2C);
    rect( -5, -60, 10, 30, 30);


    pop();
  }
}
