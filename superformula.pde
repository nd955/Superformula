float t = 0;

void setup() {
  size(500,500);
  
  noFill();
  stroke(255);
  strokeWeight(2);
}

void draw() {
  background(0);
  
  translate(width / 2, height / 2);
  
  beginShape();
  
  //add vertices from 0 to 2pi
  for(float theta = 0; theta < TWO_PI; theta += PI / 1000f) {
     //calculate radius from theta
     float radius = r(
       theta,
       cos(t/13f),  //a
       sin(t/11f),  //b
       10,  //m
       1,  //n1
       abs(sin(t*t/7f)),  //n2
       cos(t/53f)   //n3
     );
     
     //calculate cartesian coordinates from polar
     float x = radius * cos(theta) * 50;
     float y = radius * sin(theta) * 50;
     vertex(x,y);
  }
  
  endShape();
  
  t += 0.1;
}

float r(float theta, float a, float b, float m, float n1, float n2, float n3) {
  return pow(
    pow(abs(cos(m * theta / 4f) / a), n2)
      + pow(abs(sin(m * theta / 4f) / b), n3),
      (-1f / n1))
  ;
}
