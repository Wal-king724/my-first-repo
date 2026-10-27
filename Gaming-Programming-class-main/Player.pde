class MainCharacter {
  //variables
  float xPos;
  float yPos;
  float xVelo;
  float yVelo;
  int bad;
  int good;
  float size;
  float health;
  Gun weapon;
  int bullets;
  Key tools;
  Medkit m;
  Point Coins;
  int iFrames = 0;
  PImage pRight, pDown;
  int points;
  
  
  MainCharacter() {
    //initializations from setup()
    xPos = random(0, 400);
    yPos = random(300, 600);
    xVelo = 0;
    yVelo = 0;
    bad = #B43A3A;
    good = #2795cc;
    size = 60;
    health = 100;
    pRight = loadImage("player10.png");
    pRight.resize(60, 150);
    points = 0;
  }


  void display() {
    //draw()
    if (!theGame.opened){
      xPos += xVelo;
      yPos += yVelo;
    }

    if (weapon != null) {
      weapon.xPos = xPos+70;
      weapon.yPos = yPos+0;
    }
    if (tools != null) {
      tools.xPos = xPos+70;
      tools.yPos = yPos+0;
    }
    
      if (m != null) {
      m.xPos = xPos+35;
      m.yPos = yPos+0;
    }
     
    
    //if (Point o : Coins) {
    //    if (o != null) {
    //      if (guy.Coins == o) {
    //        o.yPos+=10;
    //        guy.Coins = null;
    //        guy.m = null;
    //        collect.play();
    //      }
    //      if (dist(o.xPos, o.yPos, guy.xPos, guy.yPos) <= 80) {
    //        if (guy.Point == null) {
    //          guy.point =+ 1;
    //        }
    //      }
    
    //    }
    //  }
    
    
    
    
    
    //teleport from right to left
    //if (xPos > width) {
    // xPos = random(0, 800);
    //}
    ////teleport from bottom to top
    //if (yPos > height) {
    //   yPos = random(-40, 800);
    //}

    //if (xPos >= width-200) {
    //  size = 100;
    //  bad = #B43A3A;
    //} else {
    //  size = 60;
    //  bad = #B45288;
    //}
    //if (xPos >= width-400) {
    //  size = 100;
    //  bad = #B43A3A;
    //} else {
    //  size = 60;
    //  bad = #B45288;
    //}


    //main character
    push();
    translate(xPos, yPos);
    imageMode(CENTER);
    image(pRight, 0, 0);
    //fill(#DBB875);
    //ellipse( 0, 0, 60, 80);
    //fill(#FA8F86);
    //rect( -10, 10, 20, 10);
    //fill(#00BDFF);
    //ellipse ( -10, -20, 10, 10);
    //fill(#00BDFF);
    //ellipse ( 10, -20, 10, 10);

    pop();
  }
}
