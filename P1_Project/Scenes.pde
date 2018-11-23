class Scenes {



  Scenes() {
  }
  void display() {
   
  }

  void backButton() {

    int rectX=50;
    int rectY=750;
    int rectW=50;
    int rectH=50;

    fill(#C91A1A);
    rect(rectX, rectY, rectW, rectH);
    mouseReleased();
  }


  void mouseSluppet() {
    int rectX=50;
    int rectY=750;
    int rectW=50;
    int rectH=50;

    fill(#C91A1A);
    rect(rectX, rectY, rectW, rectH);
    
    mouseReleased();{

    if (mouseX > rectX && mouseY > rectY && mouseX <rectW+rectX && mouseY<rectH+rectY) {
      currentSceneIndex -=1;
       
    }
    //hej med dig
    
    }
  }
}
