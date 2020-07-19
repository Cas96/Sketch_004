PImage img;
int n;
float q;
float x;
float y;
float r;
int c = -1;
float[]r0 = {0, 0.5, 1, 1.5};
float[]r1 = {0.5, 1}; 
float[]r2 = {0, 1.5};
float[]rex;
int i;
float red;
float green;
float blue;
float z;
float f;
float l;
float h;

void setup() {
  size(1000, 1000);
  frameRate(1000);
  background(0);
  imageMode(CENTER);
  img = loadImage("img2.jpg");
  n = 20;
  l = 50;
  h = 255;
  q = width / n;
  x = (0.5*q);
  y = (0.5*q);
  rex = new float[(n*n) + 1];
}

void draw() {    

  if (f == 0 && c < (n*n)) {
    println("    CHAOS MODE");
  }
  if (f == 1 && c < (n*n)) {
    println("    ZEN MODE");
  }


  if (c < (n*n) + 1) {                          
    c++;
  }

  if (c > -1 && c < (n*n) + 1) {

    if (i >= -1 && i < rex.length-1) {
      rex[i] = r;
      i++;
    }


    if (f == 0) {
      int index0 = int(random(r0.length));
      r = (r0[index0]);
    } else if (f == 1) {

      int index0 = int(random(r0.length));  
      int index1 = int(random(r1.length));  
      int index2 = int(random(r2.length));

      if (c > -1 && c < n) { 
        if (c == 0) {                          
          r = (r0[index0]);
        } else if (rex[i-1] == 0 || rex[i-1] == 1.5) {
          r = (r1[index1]);
        } else if (rex[i-1]== 0.5 || rex[i-1] == 1) { 
          r = (r2[index2]);
        }
      } else if (c > n - 1) {
        if (rex[i-1] == 0.5 && rex[i-n] == 1) {
          r = 0;
        } else if (rex[i-1] == 0.5 && rex[i-n] == 1.5) {
          r = 0;
        } else if (rex[i-1] == 1 && rex[i-n] == 1) {
          r = 0;
        } else if (rex[i-1] == 1 && rex[i-n] == 1.5) {
          r = 0;
        } else if (rex[i-1] == 0 && rex[i-n] == 1) {
          r = 0.5;
        } else if (rex[i-1] == 0 && rex[i-n] == 1.5) {
          r = 0.5;
        } else if (rex[i-1] == 1.5 && rex[i-n] == 1) {
          r = 0.5;
        } else if (rex[i-1] == 1.5 && rex[i-n] == 1.5) {
          r = 0.5;
        } else if (rex[i-1] == 0 && rex[i-n] == 0) {
          r = 1;
        } else if (rex[i-1] == 0 && rex[i-n] == 0.5) {
          r = 1;
        } else if (rex[i-1] == 1.5 && rex[i-n] == 0) {
          r = 1;
        } else if (rex[i-1] == 1.5 && rex[i-n] == 0.5) {
          r = 1;
        } else if (rex[i-1] == 0.5 && rex[i-n] == 0) {
          r = 1.5;
        } else if (rex[i-1] == 0.5 && rex[i-n] == 0.5) {
          r = 1.5;
        } else if (rex[i-1] == 1 && rex[i-n] == 0) {
          r = 1.5;
        } else if (rex[i-1] == 1 && rex[i-n] == 0.5) {
          r = 1.5;
        }
      }
    }

    if (c > 0 && x < (q*n) && x > 0) {
      x = x + q;
    }
    if (x > q*n) {
      x = 0.5*q;
      y = y + q;
    }

    if (z == 7) {
      z=0;
    }  
    if (z == 0) {
      println("    RED");
      red = floor(random(l, h));
      green = 0;
      blue = 0;
    }
    if (z == 1) {
      println("    GREEN");
      red = 0;
      green = floor(random(l, h));
      blue = 0;
    }
    if (z == 2) {
      println("    BLUE");
      red = 0;
      green = 0;
      blue = floor(random(l, h));
    }
    if (z == 3) {
      println("    RED+GREEN");
      red = floor(random(l, h));
      green = floor(random(l, h));
      blue = 0;
    }
    if (z == 4) {
      println("    RED+BLUE");
      red = floor(random(l, h));
      green = 0;
      blue = floor(random(l, h));
    }
    if (z == 5) {
      println("    GREEN+BLUE");
      red = 0;
      green = floor(random(l, h));
      blue = floor(random(l, h));
    }
    if (z == 6) {
      println("    CONFETTI");
      red = floor(random(l, h));
      green = floor(random(l, h));
      blue = floor(random(l, h));
    }

    tint(red, green, blue);
    translate(x, y);
    rotate(r*PI);  
    image(img, 0, 0, q, q);

    print("Image ");
    println(floor(c));
    print("    x = ");
    println(x);
    print("    y = ");
    println(y);
    print("    r = ");
    println(r);
    print("    RGB = ");
    print(red);
    print(" ");
    print(green);
    print(" ");
    println(blue);

    if (c > n - 1) {
      print("    r-1 = ");
      println(rex[i-1]);
      print("    r-");
      print(n);
      print(" = ");
      println(rex[i-n]);
    }
  }
}

void keyPressed() {
  if (key == 's') {
    saveFrame("######.jpg");
  }
  if (key == 'r') {
    c = - 1;
    i = 0;
    setup();
  }
  if (key == 'c') {
    c = - 1;
    i = 0;
    z++;
    setup();
  }
  if (key == 'f') {
    if (f == 0) 
    {
      f++;
    } else if (f > 0) {
      f = 0;
    }
  } 
  if (key == 't') {
    PFont myFont;
    myFont = createFont("Consolas", 72);
    textFont(myFont);
    textAlign(LEFT, CENTER);
    fill(220);
    text("CREATIVE CODING 2020", q, q);
    textSize(50);
    text("KEMPERS C", q, (n*q) - 2*q);
    textSize(50);
    text("HOCHSCHULE OSNABRUCK", q, (n*q) - q);
  }
}
