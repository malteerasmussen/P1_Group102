class Scene3 extends Scenes  {
  
    Choice scene3Choice = new Choice(100, 100, 35, 12);
  
  /*void display(){
    background(#FF0808);
  }*/
  
  void display(){
    background(255);
    scene3Choice.display();
    scene3Choice.button();
  }
}
