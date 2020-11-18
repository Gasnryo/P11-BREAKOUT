void keyPressed() {
  if (mode == 0) {
    //introKBP();
  } else if (mode == 1) {
    gameKBP();
  } else if (mode == 2) {
    pauseKBP();
  } else if (mode == 3) {
    //gameoverKBP();
  } else if (mode == 4) {
    //optionsKBP();
  }
}

void keyReleased() {
  if (mode == 0) {
    //introKBR();
  } else if (mode == 1) {
    gameKBR();
  } else if (mode == 2) {
    //pauseKBR();
  } else if (mode == 3) {
    //gameoverKBR();
  } else if (mode == 4) {
    //optionsKBR();
  }
}
