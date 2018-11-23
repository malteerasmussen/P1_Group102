class Scene7 extends Scenes {


  



  void display() {
    background(255);
    textAlign(CENTER);
    fill(255,0,0);
    textSize(40);
    text("Room for improvement",width/2,height/8);
    
    rectMode(CENTER);
    fill(0,100);
    noStroke();
    textSize(25);
    rect(width/2,height/2,width-100,height/2,20);
    fill(0);
    text("You seem to have some trouble with keeping the weights straight. This is important in order to prevent injuries. Try again and make sure you focus on keeping the weights straight.",width/2,height/2,width-100,height/2);
  }
}
