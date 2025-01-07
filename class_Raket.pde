// lyde: https://www.epidemicsound.com/sound-effects/fireworks/ //<>// //<>// //<>// //<>// //<>// //<>// //<>//
class Rocket {
  PVector location = new PVector(0, height);
  PVector velocity;

  int dia=5;

  // farver RGB og opauqe værdi alfa
  int r=int(random(256));
  int g=int(random(256));
  int b=int(random(256));
  int alfa=255;

  int gram = int(random(100, 400));
  int lunte= int(random(1, 10));
  float angle=int(random(1, 7));
  boolean soundPayed = false;
  boolean lift= true; // bruges til bang lyd


  //construktor
  Rocket() {
    velocity = new PVector(angle, -3);
  }



  void displayRocket() {
    fill(190);
    //noStroke();
    circle(location.x, location.y, dia);
    stroke(2);
  }




  void playFireSound() {
    if (location.y==height) {
      start.play();
    }
  }

  void playExplodingSound() {
    if (!soundPayed && !lift) {
      Rocket2.play();
      soundPayed = true;
    }
  }

  void moveRocket() {

    location.add(velocity);
    if (location.y < gram) { // hvis  jeg har nået toppen og ikke er færdig
      velocity.x=0.8;
      velocity.y=-0.1;
      lift=false;
    }
  }


  //er Rocketten færdig??
  boolean done() {
    if (location.y<gram ) {
      return true;
    }
    return false;
  }


  void display() {
    println(location);
    println(velocity);

    println( dia);

    // farver RGB og opauqe værdi alfa
    println( r);
    println( g);
    println( b);
    println(alfa);

    println(gram);
    println(lunte);
    println(angle);
    println(soundPayed);
    println(lift);
  }

  void flyRocket() {
    playFireSound();
    moveRocket();
    if (done()) {
      eksploderRocket();
    } else {
      displayRocket();
    }
    playExplodingSound();
  }

  void reset() {


    // farver RGB og opauqe værdi alfa
    r=int(random(256));
    g=int(random(256));
    b=int(random(256));
    alfa=255;

    gram = int(random(100, 400));
    lunte= int(random(1, 10));
    angle=int(random(1, 7));
    soundPayed = false;
    lift= true; // bruges til bang lyd
    location = new PVector(0, height);
    velocity = new PVector(angle, -3);
    dia=5;
  }

  void eksploderRocket() {
  } // made to overwrite
  
}
/*************************************/

class Rocket1 extends Rocket {
  void eksploderRocket() {
    noStroke();
    if (dia < 500) {
      fill(r, g, b, alfa);
      dia++;
      circle(location.x, location.y, dia);
      // gør eksplosion gennemsigtig
      alfa--;
    }
    stroke(2);
  }
}
/*************************************/

class Rocket2 extends Rocket {

  void eksploderRocket() {

    pushMatrix();
    translate(location.x, location.y);
    stroke(r, b, g, alfa);

    for (int i=0; i<360; i++) {
      fill(r, g, b, alfa);
      rect(0, 0, 0, 1*i);
      rotate(1);
    }
    popMatrix();
    // gør eksplosion gennemsigtig
    alfa--;
  }
}

/*************************************/

class Rocket3 extends Rocket {



  void eksploderRocket() {

    pushMatrix();
    translate(location.x, location.y);
    stroke(r, b, g, alfa);

    for (int i=0; i<100; i++) {
      fill(r, g, b, alfa);
      rect(0, 0, 0, 1*i);
      rotate(1);
    }
    popMatrix();
    // gør eksplosion gennemsigtig
    alfa--;
  }
}
