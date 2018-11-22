class Choice{
  String[] choicearray1 = new String[7]; //Et array med text til boksene
  int diff = 5;
  PImage imgchoice = loadImage("Images/bgTest.jpg");
  color colorchoice = #F70505;
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
  imageMode(CORNER);
    image(imgchoice,0,0);
    float X;
    float Y;
    for( int i = 1; i < 8; i ++){ // et for-loop som laver boksene + text
      if(i < diff){ // diff er hvornår boksene skal skifte position
        X = 0;
        Y = 0;
      }
      else{ //det her er så de skifter position
      X = width-2*boxX;
      Y = boxY*4;
      }
      color(255,0,0);
      rectMode(CENTER);
      
      rect(boxX+X,boxY*i-Y,boxS*2,boxS);
      
      //color(txtc);
      textSize(txtS);
      text(/*choicearray1[i]*/"hej", boxX+X,boxY*i-Y);
      //textMode(CENTER);
    }
  }
  
}
