//Angles for rotation of the earth
float angleY;
float angleX;
float anglelX;
float anglelY;
//Defining of images
PImage earth;
PImage space;
PImage iss;
//Defining the shape object of the earth
PShape earth1;
PShape satelite;
//Rotation of the earth and labal
float rotY;
float rotX;
float rotlX;
float rotlY;

//ids
String[] ids = {"29", "28485", "25544", "50"};


//radius of the earth in real life.
float earthr = 6371;

//Radius of the earth in pixels. 
float r = 200;
//Real
String id = "29";
//String url = "https://www.n2yo.com/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/"; 
String url = "https://www.n2yo.com/rest/v1/satellite/";

String pos = "positions/";
String post = "/41.702/-76.014/0/2/";
String apiKey = "&apiKey=PN6542-W8YK2Y-4VN8E8-4KIN";
String request = url+pos+ids[0]+post+apiKey;
String request1 = url+pos+ids[1]+post+apiKey;
String request2 = url+pos+ids[2]+post+apiKey;
String request3 = url+pos+ids[3]+post+apiKey;

String requ = request1; 
String nam = "SWIFT";
//String request;

void setup() {
  //json = loadJSONObject(request);
  noStroke();
  space = loadImage("space.jpg");
  earth = loadImage("world1.jpg");
  iss = loadImage("iss.jpg");
  satelite = createShape(SPHERE, 2);
  satelite.setTexture(iss);
  earth1 = createShape(SPHERE, r);
  earth1.setTexture(earth);
  size(600, 600, P3D);
}

void draw() {

  background(space);
  translate(width/2, height/2);

  angleY += rotY;
  angleX += rotX;

  rotateY(angleY);
  rotateX(angleX);

  fill(200);
  noStroke();

  if (started) {
    shape(earth1);
    data(requ, nam);
  }

  if (!started) {
    intro();
  }
}

void keyPressed() {
  if (key == 'a' || key == 'A') {
    rotY = -0.01;
    //rotlY = 0.01;
  }

  if (key == 'd' || key == 'D') {
    rotY = 0.01;
    //rotlY = -0.01;
  }

  if (key == 'w' || key == 'W') {
    rotX = 0.01;
    //rotlX = -0.01;
  }
  if (key == 's' || key == 'S') {
    rotX = -0.01;
    //rotlX = 0.01;
  }
  if (key == 'v' || key == 'V') {
    requ = request1; 
    nam = "SWIFT";
  }
  if (key == 'c' || key == 'C') {
    requ = request; 
    nam = "TIROS 1";
  }
  if (key == 'b' || key == 'B') {
    requ = request2;
    nam = "ISS";
  }
  if (key == 'n' || key == 'N') {
    requ = request3;
    nam = "DELTA 1 R/B";
  }
}

void keyReleased() {
  if (key == 'a' || key == 'A') {
    rotY = 0;
    //rotlY = 0;
  }

  if (key == 'd' || key == 'D') {
    rotY = 0;
    //rotlY = 0;
  }
  if (key == 'w' || key == 'W') {
    rotX = 0;
    //rotlX = 0;
  }
  if (key == 's' || key == 'S') {
    rotX = 0;
    //rotlX = 0;
  }
}
