class Ball {

  final static int MOVING = 0;
  final static int GROWING = 1;
  final static int SHRINKING = 2;
  final static int DEAD = 3;

  //other constants necessary?

  float x;
  float y;
  float rad;
  color c;
  float dx;
  float dy;
  int state;


  Ball() {
    float r = random(256);
    float g = random(256);
    float b = random(256);
    c = color(r, g, b);

    rad = 10;

    x = random((width - r) + r/2);
    y = random((height - r) + r/2);

    dx = random(10) - 5;
    dy = random(10) - 5;

    state = MOVING;
  }


  void move() {
    x = x + dx;
    y = y + dy;
    bounce();
  }
  
  void bounce(){
    if (x <= rad || x >= 600 - rad)
        dx = -dx;
    if (y <= rad || y >= 600 - rad)
        dy = -dy;
  }

  void draw(){
    if (state != DEAD){
      fill(c);
      ellipse(x, y, rad*2, rad*2);
    }
  }

  void process(){
    if (rad <= 0)
       state = DEAD;
    if (rad >= 50){
         state = SHRINKING;
    }
    if (state == GROWING)
      rad += 0.5;
    
    if (state == SHRINKING)
      rad -=0.5;
    
    if (state == MOVING)
      move();
    
  }
 boolean isTouching(Ball other) {
      float dSqrd = ((other.x - x)*(other.x - x)) + ((other.y - y)*(other.y - y));
      if (dSqrd <= (rad+other.rad) * (rad+other.rad))
          return true;
      return false;
 }

}//end class Ball