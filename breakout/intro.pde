void intro() {
  intro.play();
  //gif
  imageMode(CORNER);
  image(gif[frame], 0, 0, width, height);
  frame = frame + 1;
  if (frame == gifFrames) frame = 0;
  
  //Name
  fill(mango);
  imageMode(CENTER);
  image(walmart, width/2, height*0.3, 900, 225);
  textFont(wmfont);
  textAlign(LEFT, CENTER);
  fill(255);
  textSize(165);
  text("Breakout", 54, 355);
  textSize(50);
  textAlign(CENTER, CENTER);
  fill(wmy);
  text("Click anywhere to continue...", width/2, height*0.8);
  
  lives = 3;
  victory = false;
}

void introClicks() {
 mode = 1; 
}
