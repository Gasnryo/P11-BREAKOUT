void game() {
  background(blue);
  
  win.rewind();
  failure.rewind();
  

  //paddle
  fill(wmy);
  stroke(wmy);
  circle(padx, pady, padd);
  if (akey == true && padx > padd/2) padx        = padx - paddlespeed;
 if (dkey == true && padx < width-padd/2) padx = padx + paddlespeed;
  
  

  //lives
  stroke(0);
  fill (life1);
  circle(970, 600, 31);
  fill (life2);
  circle(970, 640, 31);
  fill (life3);
  circle(970, 680, 31);

  if (lives == 3) {
    life1 = hred;
    life2 = hred;
    life3 = hred;
  } else if (lives == 2) {
    life1 = black;
    life2 = hred;
    life3 = hred;
  } else if (lives == 1) {
    life1 = black;
    life2 = black;
    life3 = hred;
  }

  //ball
  fill(255);
  stroke(255);
  circle(ballx, bally, balld);

  //timer
  if (timer > -50) {
    timer--;
  }

  //move ball
  if (timer < 0) {
    ballx = ballx + ballvx;
    bally = bally + ballvy;
  }

  //bouncing
  //if (bally <= balld/2 || bally >= height-balld/2) {
  //  ballvy=ballvy*-1;
  //} else if (ballx <= balld/2 || ballx >= width-balld/2) {
  //  ballvx=ballvx*-1;
  //}

  if (ballx <= balld/2 || ballx >= width-balld/2) {
    ballvx = ballvx*-1;
    beep.play();
    beep.rewind();
  } else if (bally <= balld/2) {
    ballvy = ballvy*-1;
    beep.play();
    beep.rewind();
  } else if (bally >= height-balld/2) {
    lives--;
    boop.play();
    boop.rewind();
    ballx = width/2;
    bally = height*0.8;
    timer = 100;
    ballvx = random(-3, 3);
    ballvy = random(1, 3);
  }

  if (lives == 0) {
    mode = 3;
    victory = false;
  }
  println(lives);

  if (dist (padx, pady, ballx, bally) <= padd/2 + balld/2) {
    beep.play();
    beep.rewind();
    ballvx = (ballx - padx)/8;
    ballvy = (bally - pady)/8;
  }

  int i=0;
  while (i < n) {
    if (alive[i] == true) {
      manageBrick(i);
    }
    i++;
  }

  if (score==35) {
    victory = true;
    mode = 3;
  }
}

void gameClicks() {
}

void gameKBP() {
  if (key == 'a' || key == 'A') akey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == ' ') {
    fill(100, 200);
    noStroke();
    rect(0, 0, width, height);
    mode = 2;
  }
}

void gameKBR() {
  if (key == 'a' || key == 'A') akey = false;
  if (key == 'd' || key == 'D') dkey = false;
}
