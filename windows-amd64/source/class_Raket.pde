// lyde: https://www.epidemicsound.com/sound-effects/fireworks/ //<>// //<>// //<>// //<>// //<>// //<>//
class Raket {
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
  Raket() {
    velocity = new PVector(angle, -3);
  }



  void visRaket() {
    fill(0);
    //noStroke();
    circle(location.x, location.y, dia);
    stroke(2);
  }

 //<>//


  void playFireSound() {
    if (location.y==height) {
      start.play();
    }
  }

  void playExplodingSound() {
    if (!soundPayed && !lift) {
      raket2.play();
      soundPayed = true;
    }
  }

  void moveRaket() {

    location.add(velocity);
    if (location.y < gram) { // hvis  jeg har nået toppen og ikke er færdig
      velocity.x=1;
      velocity.y=-0.1;
      lift=false;
    }
  }


  //er raketten færdig??
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
}
/*************************************/

class Raket1 extends Raket {
  void eksploderRaket() {
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

  void flyvRaket() {
    playFireSound();
    moveRaket();
    if (done()) {
      eksploderRaket();
    } else {
      visRaket();
    }
    playExplodingSound();
  }
}
/*************************************/

class Raket2 extends Raket {

  void eksploderRaket() {

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
  void flyvRaket() {
    playFireSound();
    moveRaket();
    if (done()) {
      eksploderRaket();
    } else {
      visRaket();
    }
    playExplodingSound();
  }
}

/*************************************/

class Raket3 extends Raket {



  void eksploderRaket() {

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

  void flyvRaket() {
    playFireSound();
    moveRaket();
    if (done()) {
      eksploderRaket();
    } else {
      visRaket();
    }
    playExplodingSound();
  }
}
