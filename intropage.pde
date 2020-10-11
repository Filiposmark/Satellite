boolean started = false;
float unit = 50;
float lineshift = unit/2;


void intro() {
  float incremation = -width/2+unit;
  float incremationy = -height/2;
  fill(255);
  rect(-width/2, -height/2, 600, 600);
  fill(0);
  text("Hello. This is a satellite illustater, using live data, to show where some satellites are.", incremation, incremationy+unit);
  text("Controls: ", incremation, incremationy+unit+2*lineshift);
  text("W,S,D,A steers the earth.", incremation, incremationy+unit+3*lineshift);
  text("Press c,v,b or n to change satellite to follow.", incremation, incremationy+unit+4*lineshift);
  text("Press the space bar to start.", incremation, incremationy+unit+6*lineshift);
  if (keyPressed) {
    started = true;
  }
}
