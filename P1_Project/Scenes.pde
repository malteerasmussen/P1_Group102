class Scenes {


  
  void display() {
    PImage bgImage;
    imageMode(CENTER);
    bgImage = loadImage("Images/gym.jpg");
    bgImage.resize(0,height);
    image(bgImage,width/2,height/2);
    
  }
  
  
}
