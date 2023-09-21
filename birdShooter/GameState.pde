class GameState {

  boolean isGameWon(ArrayList<Bird> flock)
  {
    if (flock.size() == 0)
    {
      return true;
    }
    return false;
  }

  boolean isGameOver(int HP)
  {
    if (HP == 0)
    {
      return true;
    }
    return false;
  }
}
