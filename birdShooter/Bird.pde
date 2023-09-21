class Bird
{
  PImage img;
  int x;
  int y;
  int speedX;
  int speedY;

  //each bird have an img and starts in random position with a given random speed
  Bird(int birdSpeed)
  {
    this.img = loadImage(dataPath("flyingBird.png"));
    this.x = (int) random(10, 900);
    this.y = (int) random(10, 900);
    this.speedX = birdSpeed;
    this.speedY = birdSpeed;
  }

  //makes bird move
  void fly()
  {
    collision();

    this.x += this.speedX;
    this.y -= this.speedY;
  }

  //position of bird as a  two dimensional vector
  PVector position()
  {
    //Since the img size is bigger than the actual bird object
    //we add to the position to get the birds chest/middle position
    return new PVector(this.x+50, this.y+50);
  }

  //bird "radius"/body
  int body()
  {
    //size of the hitbox for the bird
    return (int) Math.PI * 2 * 6;
  }

  //Check border collision
  void collision()
  {
    //right
    if (this.x > width-this.img.width)
    {
      this.x = width-this.img.width;
      this.speedX *= -1;
    }
    //left
    if (this.x < 0)
    {
      this.x = 0;
      this.speedX *= -1;
    }
    //top
    if (this.y < 0)
    {
      this.y = 0;
      this.speedY *= -1;
    }
    //bottom
    if (this.y > height-this.img.width)
    {
      this.y = height-this.img.width;
      this.speedY *= -1;
    }
  }

  //display the bird object
  void display()
  {
    image(this.img, this.x, this.y);
  }
}
