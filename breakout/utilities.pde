void manageBrick(int i) {
  if (y[i] == 100) fill(toprow);//fill(purple);
  if (y[i] == 200) fill(secrow);//(mango);
  if (y[i] == 300) fill(thirow);//(orange);
  if (y[i] == 400) fill(fourow);//(green);
  if (y[i] == 500) fill(botrow);//(darkblue);

stroke(255);
strokeWeight(3);
  circle(x[i], y[i], brickd);
  if (dist (ballx, bally, x[i], y[i]) <= balld/2 + brickd/2) {
    ballvx = (ballx - x[i])/8;
    ballvy = (bally - y[i])/8;
    smash.play();
    smash.rewind();
    alive[i] = false;
    score = score+1;
  }
}
