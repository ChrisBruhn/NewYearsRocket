import processing.sound.*; //<>//
SoundFile start;
SoundFile Rocket1;
SoundFile Rocket2;


//deklaration af Rocket batterier
int batteriSize = 10;
Rocket[] battery = new Rocket[batteriSize] ;

Rocket1 r1;
Rocket2 r2;
Rocket3 r3;

void setup() {
  size(1500, 800);
  start = new SoundFile(this, "start.mp3");
  Rocket1 = new SoundFile(this, "multiRocket.mp3");
  Rocket2 = new SoundFile(this, "rocket1.mp3");


  initBattery();

  //r1 = new Rocket1;
  //r2 = new Rocket2;
  //r3 = new Rocket3;
}



void draw() {
  background(0);


  for (int i =0; i<batteriSize; i++) {
    battery[i].flyRocket();
  }
  //r1.flyRocket();
  //r2.flyRocket();
  //r3.flyRocket();
}

void mousePressed() {
  for (int i=0; i<batteriSize; i++) {
    battery[i].reset();
  }
}

void initBattery() {
  for (int i=0; i<batteriSize; i++) {
    battery[i] = new Rocket2();
  }
}
