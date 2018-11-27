class Choice{
  String[] choicearray1 = new String[8];{
    choicearray1[1] = "BACK";
    choicearray1[2] = "CHEST";
    choicearray1[3] = "ABS";
    choicearray1[4] = "BICEPS";
    choicearray1[5] = "TRICEPS";
    choicearray1[6] = "SHOULDERS";
    choicearray1[7] = "LEGS";
  }
  String[] choicearray2 = new String[8];{
    choicearray2[1] = "FRONT \nSQUADS";
    choicearray2[2] = "DEADLIFT";
    choicearray2[3] = "SINGLE \nARM ROW";
    choicearray2[4] = "KETTLEBELL \nSWINGS";
    choicearray2[5] = "PULLOVER";
    choicearray2[6] = "WIDE ROW";
    choicearray2[7] = "GOOD \nMORNINGS";
  }
  
  int diff = 5;
 // PImage imgchoice = loadImage("image.jpg");
  color colorchoice = #3DC9F2;
  int txtc = 0;
  
  float boxX;
  float boxY;
  float boxS;
  float txtS;
  
  Choice(float _boxX, float _boxY, float _boxS, float _txtS){
  boxX = _boxX;
  boxY = _boxY;
  boxS = _boxS;
  txtS = _txtS; 
  }
  
  void display(){
    
  //  background(imgchoice);
   // image(imgchoice,0,0,400,600);
    float X;
    float Y;
    int c = 7;
    for( int i = 1; i < 8; i ++){
      if(i < diff){
        X = 0;
        Y = 0;
      }
      else{
      X = width - boxX*2;
      Y = boxY*4;
      }
      fill(colorchoice,100);
      stroke(colorchoice,100);
      rectMode(CENTER);
      rect(boxX+X,boxY*i-Y,boxS*2,boxS,c);
      
      fill(txtc);
      textSize(txtS);
      textAlign(CENTER);
      if(currentSceneIndex == 1){
      text(choicearray1[i], boxX+X,boxY*i-Y);
      }
      if(currentSceneIndex == 2){
      text(choicearray2[i], boxX+X,boxY*i-Y);
      }
    }
  }
  void button(){
    float lowx = boxX-boxS;
    float highx = boxX+boxS;
    //println(lowx,highx);
    float lowy = boxY-boxS/2;
    float highy = boxY+boxS/2;
    
    float newlowy = (boxY-boxS/2)*2;
    float newhighy = (boxY+boxS/2)*2;

    //println(lowy,highy);
    println("scene "+currentSceneIndex);
    
    
    
    if(currentSceneIndex == 1 && mousePressed && mouseX > lowx && mouseX < highx && mouseY > lowy && mouseY < highy){
        currentSceneIndex = 2;
        println(1);
      }
      if(currentSceneIndex == 2 && mousePressed && mouseX > lowx && mouseX < highx && mouseY > newlowy && mouseY < newhighy){
        currentSceneIndex = 0;
        println(2);
      }

  }
}
