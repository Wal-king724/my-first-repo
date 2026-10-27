class Exit {
  //variables

  
  float xPos;
  float yPos;
  float xVelo;
  float yVelo;
  //initializations from setup()


  Exit() {
    //initializations from setup()
    xPos = random(400, 40);
    yPos = random(250, 250);
    xVelo = 0;
    yVelo = 0;
   
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
   

    
   
 //ellipse( 
 if (!theGame.opened){
  fill(#895858);
    rect( -100, -10, 75, 110);
       fill(#6F5D5D);
    rect( -50, -10, 10, 110);
     fill(#6F5D5D);
    rect( -85, -10, 10, 110);
   fill(#F9FA05);
    ellipse( -35, 50, 10, 10);
   
    pop();
 } else {
   fill(#000000);
   rect( -100, -10, 75, 110);
 }
  }
}
