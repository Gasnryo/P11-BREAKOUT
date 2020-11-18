void gameover() {
  intro.rewind();
  //background(blue);
  imageMode(CORNER);
  image(gif[frame], 0, 0, width, height);
  frame = frame + 1;
  if (frame == gifFrames) frame = 0;

  if (victory == true) {
    win.play();
    fill(mango);
    text("YOU WIN", width/2, height/2);
  } else if (victory == false) {
    failure.play();
    fill(mango);
    text("LOSER LOSER LOSER", width/2, height/2);
  }
}

void gameoverClicks() {
  int i = 0;
  while (i < n) {
    if ((score == n || (lives == 0))) {
      alive[i] = true;
      i = i + 1;
    }
  }
  score = 0;
  lives = 3;
  n = 35;
  padx = width/2;
  ballx = width/2;
  bally = height*0.8;



  mode = 0;
}
