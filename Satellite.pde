JSONArray satdat;
float x, y, z;
int frames = 0;

void data(String req, String name) {

  if (frameCount >= frames) {
    frames += 100;
    satdat = loadJSONObject(req).getJSONArray("positions");
  }

  for (int i=0; i < satdat.size(); i++) {
    JSONObject sat = satdat.getJSONObject(i);
    float slat = sat.getFloat("satlatitude");  
    float slon = -sat.getFloat("satlongitude");
    float sele = sat.getFloat("sataltitude");
    float theta = radians(slat) + PI/2;
    float phi = radians(slon) + PI;
    float x = r * sin(theta) * cos(phi);
    float y = r * cos(theta);
    float z = r * sin(theta) * sin(phi);

    //Gives the altitude on the sketch according to earth size and satillite altitude irl.
    float h = sele*r/earthr;

    PVector satpos = new PVector(x, y, z);
    PVector unitv = new PVector(1, 0, 0);
    float anglebetween = PVector.angleBetween(unitv, satpos);
    PVector rv = unitv.cross(satpos);

    pushMatrix();
    translate(x, y, z); 
    rotate(anglebetween, rv.x, rv.y, rv.z);
    translate(h, 0, 0);
    fill(255, 0, 0);
    sphere(2);
    rotate(-anglebetween, rv.x, rv.y, rv.z);
    textSize(9);
    text(name, unitv.x, unitv.y, unitv.z);
    //println("lat: " + slat + ", "+"lon: "+ slon /*+", "+ "ele: "+z +", frames: "+frameCount*/);
    popMatrix();


    //println("MouseY: "+mouseY + ", y: " + y, "MouseX: " +mouseX + ", x: " + x);
  }
}
