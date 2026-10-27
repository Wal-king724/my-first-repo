class Bullets {
  //variables
  float xPos;
  float yPos;
  float xVelo;
  float yVelo;

  boolean fired = false;

  boolean display = true;
  boolean displayed = false;

  boolean enemy = false;

  Bullets(float x, float y) {
    //initializatioans from setup()
    xPos = x;
    yPos = y;
    xVelo = 1;
    yVelo = 1;
  }


  void display() {
    //draw()

    xPos += xVelo;
    yPos += yVelo;


    //teleport from right to left
    if (!fired) {
      if (xPos > width) {
        xPos = 0;
      }
      //teleport from bottom to top
      if (yPos > height) {
        yPos = 0;
      }
    } else {
      if (display && !enemy) {
        display = false;
        theGame.bulletsShot++;
      }
    }


    //Bullets

    push();

    translate(xPos, yPos);
    if (fired) {
      if (enemy) {
        rotate(3*PI/2);
      } else {
        rotate(PI/2);
      }
    }
    fill(#FCD700);
    triangle( 0, 0, 10, -10, 20, 0);
    fill(#F5C219);
    rect(0, 0, 20, 30);
    fill(#ADA684);
    rect ( 0, 32, 20, 4, 50);
    fill(#F7F4E8);
    rect( 1, 30, 18, 2, 20);

    pop();
  }
}
