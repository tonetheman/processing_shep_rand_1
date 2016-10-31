
// saw this
// http://inconvergent.net/shepherding-random-numbers/
// this is the first of his idea
// random points no memory

int POINT_SIZE = 15;
int GAP = 20;
int COUNT = 20;
int OFFSET = 25;

class RandomPoint {
  float target;
  float current_y;
  int _hpos;
  
  RandomPoint(int hpos) {
    _hpos = hpos;
  }
  
  void init() {
    target = (int)random(0, height);
    //current_y = height/2;
  }
  void update() {
    if (current_y<target) {
      current_y++;
    } else if (current_y>target) {
      current_y--;
    } else if (current_y==target) {
      init();
    }
  }
  void draw() {
    
    // draw target
    fill(255,0,0,100);
    ellipse(_hpos, target, POINT_SIZE,POINT_SIZE);
    
    // draw new point
    fill(180);
    ellipse(_hpos, current_y, POINT_SIZE,POINT_SIZE);
  }
}

RandomPoint rp[];

void setup() {
  size(400,200);
  
  rp = new RandomPoint[COUNT];
  for(int i=0;i<rp.length;i++) {
    rp[i] = new RandomPoint(i*GAP+OFFSET);
    rp[i].init();
    rp[i].current_y = height/2;
  }
}

void draw() {
  background(0);
  for(int i=0;i<rp.length;i++) {
    rp[i].update();
    rp[i].draw();
  }
}