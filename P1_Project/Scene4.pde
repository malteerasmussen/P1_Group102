class Scene4 extends Scenes {

  Choice scene4Choice = new Choice();
  
float dist = 25;
color c = #3DF25C;
int e = 7;


  void display() {
    background(255);
    scene4Choice.display();
    fill(c,100);
    rectMode(CORNERS);
    rect(dist,dist,width-dist,height-dist);
  }
}
