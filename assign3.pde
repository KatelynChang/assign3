PImage bg1, bg2, end1, end2, enemy1, fighter, hp, start1, start2, treasure;
final int GAME_START=1, GAME_RUN=2, GAME_OVER=3;  
int gameState;

//gamebackground
int bg1X, bg2X, bg3X;

//fighter
float fighterX, fighterY;
int fighterSpeed = 5;

//fightermove
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

//hp
int hpLong;

//enemy
int enemyX1, enemyX2, enemyX3, enemyY1, enemyY2, enemyY3; 
int enemyWidth, enemyHeight;
int enemySpeed;
int enemySpacing;


//treasure
int treasureX, treasureY;



void setup(){
  size(640,480);
  colorMode(RGB);
  
  gameState = GAME_START;
  
  //image
  bg1 = loadImage("img/bg1.png");
  bg2 = loadImage("img/bg2.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
  enemy1 = loadImage("img/enemy.png");
  fighter = loadImage("img/fighter.png");
  hp = loadImage("img/hp.png");
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");
  treasure = loadImage("img/treasure.png");
  
  //background
  bg1X=0;
  bg2X=0;
  
  //fighter
  fighterX = 640-62;
  fighterY = 240;
  
  //hp
  hpLong = 50;
  
  //enemy
  enemyX1=0; enemyX2=-(640+enemyWidth*5+enemySpacing*4+300); enemyX3=-(640*2+enemyWidth*5+enemySpacing*4+600);
  enemyY1 = floor(random(0,480-61));
  enemyY2 = floor(random(0,480-61*5));
  enemyY3 = floor(random(0,480-61*5));
  enemySpeed = 5;
  enemyWidth = 61;
  enemyHeight = 61;
  enemySpacing = 2;

  
  //treasure
  treasureX = floor(random(0,640-41));
  treasureY = floor(random(0,480-41));
  
  
}

void draw(){
  switch(gameState){
    case GAME_START: //start
    image(start2,0,0);
    if (mouseX > 200 && mouseX < 454 && mouseY > 372 && mouseY < 415){
      if (mousePressed){
        //click
        gameState = GAME_RUN;
      }else{
      image(start1,0,0);}
    }
    break;
    
    case GAME_RUN: //run
    //background
    bg1X =(bg1X+1)%1280;
    image(bg1,bg1X,0);
    bg2X =(bg1X-640+1)%1280;
    image(bg2,bg2X,0);
    bg3X =(bg2X-640+1)%1280;
    image(bg1,bg3X,0);
    
    // figtermove
    image(fighter, fighterX, fighterY);
    if (upPressed){
    fighterY = fighterY-fighterSpeed;
    if(fighterY<0){
      fighterY=0;
    }
  }
    if (downPressed){
    fighterY = fighterY+fighterSpeed;
      if(fighterY>419){
        fighterY=419;}
    }
    if (leftPressed){
    fighterX = fighterX-fighterSpeed;
       if(fighterX<0){
         fighterX=0;}
  }
    if (rightPressed){
    fighterX = fighterX+fighterSpeed;
      if(fighterX>579){
        fighterX=579;}
    }  
    
    
    
    //hp
    rectMode(CORNERS);
    rect(10,9,hpLong,25);
    fill(255,0,0);
    stroke(255,0,0);
    image(hp,2,5);
    if(hpLong >= 210){
    hpLong = 210;}
    
    //enemy
    
    //level C
    if(enemyX1<width){
      for(int row=0; row<5; row++){
      int tmpx = enemyX1+row*(enemyWidth+enemySpacing);
      image (enemy1,tmpx,enemyY1);
      }
    }
    if(enemyX1>width){
    enemyY1 = floor(random(0,480-61));}
    
    enemyX1+=enemySpeed;
    enemyX1 %= 640+640+enemyWidth*5+enemySpacing*4+300+640*2+enemyWidth*5+enemySpacing*2;
    
    //level B
    if(enemyX2<width){
      for(int row=0; row<5; row++){
      int tmpx2 = enemyX2+row*(enemyWidth+enemySpacing);
      int tmpy2 = enemyY2+row*(enemyHeight);
      image (enemy1,tmpx2,tmpy2);
    }
  }
   if(enemyX2>width){
   enemyY2 = floor(random(0,480-61*5));}
   
   enemyX2+=enemySpeed;
   enemyX2 %= 640+640+enemyWidth*5+enemySpacing*4+300+640*2+enemyWidth*5+enemySpacing*2;
   
   
   //level A
   int Xmoving = -(enemyWidth*2+enemySpacing*2);
   int Ymoving = enemyHeight*2;
   
   if(enemyX3<width){
     for(int row=0; row<3; row++){
     int tmpx3 = enemyX3+row*(enemyWidth+enemySpacing);
     int tmpy3 = enemyY3+row*(enemyHeight);
     image (enemy1, tmpx3, tmpy3);}
   }
   
   if(enemyX3<(width+enemyWidth*2)){
     for(int row=0; row<3; row++){
     int tmpx3 = Xmoving+enemyX3+row*(enemyWidth+enemySpacing);
     int tmpy3 = Ymoving+enemyY3+row*(enemyHeight);
     image (enemy1, tmpx3, tmpy3);}
   }
   
   if(enemyX3<(width+enemyWidth*2)){
     for(int row=0; row<2; row++){
     int tmpx3 = enemyX3-row*(enemyWidth+enemySpacing);
     int tmpy3 = enemyY3+row*(enemyHeight);
     image (enemy1, tmpx3, tmpy3);}
   }
   
   if(enemyX3<(width+enemyWidth*2)){
     for(int row=0; row<2; row++){
     int tmpx3 = -Xmoving+enemyX3-row*(enemyWidth+enemySpacing);
     int tmpy3 = Ymoving+enemyY3+row*(enemyHeight);
     image (enemy1, tmpx3, tmpy3);}
   }
   
    if(enemyX3>(width+enemyWidth*2)){
   enemyY3 = floor(random(0,480-enemyHeight*5));}
   
   enemyX3 += enemySpeed;
   enemyX3 %= 640+640+enemyWidth*5+enemySpacing*4+300+640*2+enemyWidth*5+enemySpacing*2;
   
  
   
   
 
    
    
   
    

  
    
    //treasure
    image(treasure, treasureX, treasureY);
    if(fighterX >= treasureX && fighterX <= treasureX+41 && fighterY >= treasureY && fighterY <= treasureY+41){
    hpLong += 20;}
    else if(fighterX+51 >= treasureX && fighterX+51 <= treasureX+41 && fighterY+51 >= treasureY && fighterY+51 <= treasureY+41){
    hpLong += 20;}
    else if(fighterX >= treasureX && fighterX <= treasureX+41 && fighterY+51 >= treasureY && fighterY+51 <= treasureY+41){
    hpLong += 20;}
    if(fighterX >= treasureX && fighterX <= treasureX+41 && fighterY >= treasureY && fighterY <= treasureY+41){
     treasureX = floor(random(0,640-41)); treasureY = floor(random(0,480-41));}
    else if(fighterX+51 >= treasureX && fighterX+51 <= treasureX+41 && fighterY+51 >= treasureY && fighterY+51 <= treasureY+41){
    treasureX = floor(random(0,640-41)); treasureY = floor(random(0,480-41));}
    else if(fighterX >= treasureX && fighterX <= treasureX+41 && fighterY+51 >= treasureY && fighterY+51 <= treasureY+41){
    treasureX = floor(random(0,640-41)); treasureY = floor(random(0,480-41));}
    
    //die
    if(hpLong <= 10){
    gameState = GAME_OVER;}
    
    break;
    
    case GAME_OVER: //gameover
    image(end1,0,0);
    if (mouseX >= 204 && mouseX < 434 && mouseY >= 306 && mouseY <= 350){
      if(mousePressed){
      gameState = GAME_RUN; fighterX = 580 ; fighterY = 240; hpLong = 50;}
    }
    else{image(end2,0,0);}
    break;
  }
}



void keyPressed(){
  if(key == CODED){
    switch (keyCode){
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
      }
    }
  }
  
void keyReleased(){
  if(key == CODED){
    switch(keyCode){
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }

}
