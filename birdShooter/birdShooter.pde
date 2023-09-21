PImage bgImg;
PImage gameWonImg;
PImage gameOverImg;
PImage hpImg;
ArrayList<Bird> flock;
ArrayList<PImage> totalHP;
Player player;
GameState gameState;

void setup() {
  //set background img
  size(1000, 600);
  loadImages();

  //Game state
  gameState = new GameState();

  //create player as crosshair
  player = new Player();

  //create player hp
  totalHP = new ArrayList<PImage>();
  for (int i = 0; i < player.getHP(); i++)
  {
    totalHP.add(hpImg);
  }

  //create a bird array and add birds
  flock = new ArrayList<Bird>();
  createBirds(5);
}

void draw() {
  //background img
  image(bgImg, 0, 0);

  //display all birds in flock
  for (Bird b : flock)
  {
    b.fly();
    b.display();
  }

  //display player
  player.displayHP(totalHP);
  player.displayCrosshair();

  //check game state
  checkGameState();
}

//load all images used in game
void loadImages()
{
  bgImg = loadImage(dataPath("blueSky.jpg"));
  gameWonImg = loadImage(dataPath("win.png"));
  gameOverImg = loadImage(dataPath("gameOver.png"));
  hpImg = loadImage(dataPath("heart.png"));
}

//create a given amount of birds
void createBirds(int amountOfBirds)
{
  //Add birds to flock
  for (int i = 0; i < amountOfBirds; i++)
  {
    //give random speed to each bird
    int birdSpeed = (int) random(1, 10);
    flock.add(new Bird(birdSpeed));
  }
}

//check the state of the game
void checkGameState()
{
  //check if game is won and display imgs if so
  if (gameState.isGameWon(flock))
  {
    image(bgImg, 0, 0);
    image(gameWonImg, 300, 150);
    stop();
  }

  //check if game is over and display imgs if so
  if (gameState.isGameOver(player.getHP()))
  {
    image(bgImg, 0, 0);
    image(gameOverImg, 250, 50);
    stop();
  }
}

void mousePressed()
{
  if (mouseButton == LEFT)
  {
    //check if a bird is hit
    boolean isHit = false;

    for (int i = 0; i < flock.size(); i++)
    {
      //get current mouse position
      PVector mousePosition = new PVector(mouseX, mouseY);

      //check the dist() between bird position and mouse position,
      //if less than "radius"/body of the bird, remove the bird from the flock ArrayList.
      if (PVector.dist(flock.get(i).position(), mousePosition) < flock.get(i).body())
      {
        flock.remove(i);
        i = flock.size();
        isHit=true;
      }
    }

    //if a bird is not hit when mouse is pressed then loose hp
    if (!isHit)
    {
      player.looseHP();
      totalHP.remove(0);
    }
  }
}
