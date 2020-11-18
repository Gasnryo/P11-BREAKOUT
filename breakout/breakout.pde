//breakout

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//MF. Mode framework, not the other MF abbreiation!!!
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
//brick variables
int[] x;
int[] y;
boolean[] alive;
int brickd;
int n;
int tempx, tempy;
int score;

//Images
PImage walmart;

PFont wmfont;

PImage[] gif;
int gifFrames;
int frame;

//colors
color brown = #45201E;
color darkblue = #272D4D;
color purple = #B83564;
color mango = #FF6A5A;
color orange = #FFB350;
color green = #83B8AA;
color blue = #007DC6;
color wmy = #FAB41D;
color hred = #800000;
color black = #000000;

color toprow;
color secrow;
color thirow;
color fourow;
color botrow;

color life1;
color life2;
color life3;

//variables

//paddle
float padx, pady, padd, paddlespeed;
boolean akey, dkey;

//ball
float ballx, bally, balld, ballvx, ballvy;
int timer;

//gameover
int lives;
boolean victory;

Minim minim;
AudioPlayer beep, win, failure, intro, smash, boop;


void setup() {
  //program setup
  size(1000, 800, FX2D);
  mode = 0;
  
  //sound
  minim = new Minim(this);
  intro = minim.loadFile("intro.wav");
  beep = minim.loadFile("beep.wav");
  failure = minim.loadFile("failure.wav");
  win = minim.loadFile("win.wav");
  smash = minim.loadFile("break.wav");
  boop = minim.loadFile("boop.wav");

  //images
  walmart = loadImage("walmart.png");
  
  wmfont = createFont("MPB.ttf", 100);
  
  gifFrames = 30;
  gif = new PImage[gifFrames];
  
  int i2 = 0;
  while (i2 < gifFrames) {
    gif[i2] = loadImage("frame_"+i2+"_delay-0.03s.gif");
    i2++;
  }
  
  //variable setup
  
  //gameover setup
  victory = false;
  lives = 3;
  
  //color rows
  toprow  = (color) random(#000000);
  secrow  = (color) random(#000000);
  thirow  = (color) random(#000000);
  fourow  = (color) random(#000000);
  botrow  = (color) random(#000000);
  
  life1 = hred;
  life2 = hred;
  life3 = hred;

  //bricks
  brickd = 50;
  n = 35;
  x = new int[n];
  y = new int[n];
  tempx = 50;
  tempy = 100;
  score = 0;
  
  alive = new boolean[n];

  int i = 0;
  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 150;
    if (tempx >= width) {
      tempx = 50;
      tempy = tempy + 100;
    }
    i=i+1;
  }


  //paddle
  padx = width/2;
  pady = height;
  padd = 150;
  paddlespeed = 7;

  //ball
  ballx = width/2;
  bally = height*0.8;
  balld = 10;
  timer = 100;

  //move ball
  ballvx = random(-3, 3);
  ballvy = random(1, 3);
}

void draw() {
  if (mode == 0) {
    intro();
  } else if (mode == 1) {
    game();
  } else if (mode == 2) {
    pause();
  } else if (mode == 3) {
    gameover();
  } else {
    println("MODE ERROR: MODE = " + mode);
  }
}
