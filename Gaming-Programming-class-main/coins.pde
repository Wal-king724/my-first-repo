class  Point {
  //variables
  float xPos;
  float yPos;
  float xVelo;
  float yVelo;
PImage pRight, pDown;
float points;


 
  

  Point(float x, float y) {
    //initializatioans from setup()
    xPos = x;
    yPos = y;
    xVelo = 1;
    yVelo = 1;
    pRight = loadImage("pixelcoin.png");
    pRight.resize(60, 60);
  }


  void display() {
    //draw()

    xPos += xVelo;
    yPos += yVelo;


    


    //Bullets

    push();

    translate(xPos, yPos);
  
  //  ellipse(0, 0, 10, 10);
        imageMode(CENTER);
    image(pRight, 0, 0);
    
    pop();
  }
}
