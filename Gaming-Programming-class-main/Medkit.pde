class Medkit {
  //variables


  float xPos;
  float yPos;
  float xVelo;
  float yVelo;
  boolean used ;


  //initializations from setup()


  Medkit(float x, float y) {
    //initializations from setup()
    xPos = y;
    yPos = x;
    xVelo = 0;
    yVelo = 0;
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
    ////if (yPos > height/2) {
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

    fill(#FFFFFF);
    rect( 0, 0, 75, 50);

    line(0, 0, 35, -35);
    line(75, 0, 35, -35);
    fill(#FA0808);
    rect( 20, 20, 30, 10);
    fill(#FA0808);
    rect( 30, 10, 10, 30);





    pop();
  }
}
