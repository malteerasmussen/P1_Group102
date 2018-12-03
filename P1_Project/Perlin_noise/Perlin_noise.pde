float xtime = 0.0;
float ytime = 200.0;
float increment = 0.1;

void setup(){
 size(200,200);
 
}

void draw(){
 background(155);
 float x = noise(xtime) * width;  //noise value at time and scaled according to to window size
  float y = noise(ytime) * height;  //=||=
  xtime += increment;  
  ytime += increment;  

  stroke(0);
  fill(175);  
  ellipse(x, y, 30, 30);
  
}
  
