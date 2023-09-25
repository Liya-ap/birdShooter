class Player
{
  int HP;
  
  Player()
  {
    this.HP = 3;
  }
  
  int getHP()
  {
    return this.HP;
  }
  
  void loseHP()
  {
    this.HP--;
  }
  
  //create a crosshair
  void displayCrosshair()
  {
    ellipseMode(CENTER);
    noFill();
    strokeWeight(4);
    ellipse(mouseX, mouseY, 100, 100);
    fill(255, 0, 0);
    strokeWeight(2);
    ellipse(mouseX, mouseY, 5, 5);

    fill(0);
    beginShape(TRIANGLES);
    //up
    vertex(mouseX, mouseY-10);
    vertex(mouseX-5, mouseY-65);
    vertex(mouseX+5, mouseY-65);

    //left
    vertex(mouseX+10, mouseY);
    vertex(mouseX+65, mouseY-5);
    vertex(mouseX+65, mouseY+5);

    //down
    vertex(mouseX, mouseY+10);
    vertex(mouseX-5, mouseY+65);
    vertex(mouseX+5, mouseY+65);

    //right
    vertex(mouseX-10, mouseY);
    vertex(mouseX-65, mouseY-5);
    vertex(mouseX-65, mouseY+5);
    endShape();
  }
  
  //display the overall hp 
  void displayHP(ArrayList<PImage> totalHP)
  {
    for(int i = 0; i < totalHP.size(); i++)
    {
      image(totalHP.get(i), 70+i*40, i+30);
    }
  }
}
