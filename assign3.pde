//You should implement your assign3 here.
PImage  bg1, bg2,enemy,fighter,hp,treasure;
float bg1X,bg2X,fighterX,fighterY,treasureX,treasureY,enemyX,enemyY,speedX,speedY,enemySpace;
int gameState,i=0,j=0;
boolean goUp = false;
boolean goDown = false;
boolean goLeft = false;
boolean goRight = false;

void setup(){
 bg1 = loadImage("img/bg1.png");
 bg2 = loadImage("img/bg2.png");
 enemy = loadImage("img/enemy.png");
 fighter = loadImage("img/fighter.png");
 hp = loadImage("img/hp.png");
 treasure = loadImage("img/treasure.png");
  size(640, 480) ;
   bg1X=640;
   bg2X=0;
 treasureX = random(100,600);
 treasureY = random(50,400);
 fighterX = random(300,580);
 fighterY = random(100,400);
 enemyX = 0;
 enemyY = random(100,300);
 speedX = 1;
 speedY = 1;
 gameState = 1;
 enemySpace=66;//敵機所占的空間大小
}


void draw(){
  background(0);
  image(bg1,bg1X-640,0);
  image(bg2,bg2X-640,0);
  bg1X++;
  bg2X++;
  bg1X%=1280;
  bg2X%=1280;
  // hp bar
  noStroke();
  fill(#FF0000);
  rect(32,32,200,22);
  image(hp,25,30);
  //treasure appears
  image(treasure,treasureX,treasureY);
  //fighter apears
  image(fighter,fighterX,fighterY);
  //fighter can not move beyond the area
   if(fighterX<=0) fighterX = 0;
   if(fighterX>=width-51) fighterX=width-51;
   if(fighterY<=0) fighterY=0;
   if(fighterY>=height-51) fighterY = height-51;
  // key-controlling the fighter 
  if(goUp) fighterY-=2;
  if(goDown) fighterY +=2;
  if(goLeft) fighterX -=2;
  if(goRight) fighterX +=2;
  
 //game state changing 
  switch(gameState){
    //enemies go in line 敵機成一列行進
    case 1:
      for(i=0;i<5;i++){
        image(enemy,enemyX-i*enemySpace,enemyY);
        }
        enemyX+=4;//All appear then forward
        
      if(enemyX-i*enemySpace>=width) {
        enemyX = 0;
        enemyY = random(20,150);
        gameState = 2;//進入第二階段
      }
      break;
      
     //enemies go a angled line敵機排成斜角行進
    case 2:
       for(i=0;i<5;i++){
         image(enemy,enemyX-i*enemySpace,enemyY+i*enemySpace);
          }
          enemyX+=4;//All appear then forward
       if(enemyX-i*enemySpace>=width) {
        enemyX = 0;
        enemyY = random(20,100);
        gameState = 3;//變成第三階段
      }
      break;
       //enemies go in a diamond shape 敵機呈菱形編隊行進
     case 3:
       //窮舉法
       for(i=1;i<=5;i++){
        for(j=1;j<=5;j++){
         if(i==1&&j==3) image(enemy,enemyX-2*enemySpace,enemyY);//當座標位於第一列第三行時出現機圖案，餘類推
         if(i==2&&j==2) image(enemy,enemyX-3*enemySpace,enemyY+enemySpace);
         if(i==2&&j==4) image(enemy,enemyX-1*enemySpace,enemyY+enemySpace);
         if(i==3&&j==1) image(enemy,enemyX-4*enemySpace,enemyY+2*enemySpace);
         if(i==3&&j==5) image(enemy,enemyX,enemyY+2*enemySpace);
         if(i==4&&j==2) image(enemy,enemyX-3*enemySpace,enemyY+3*enemySpace);
         if(i==4&&j==4) image(enemy,enemyX-1*enemySpace,enemyY+3*enemySpace);
         if(i==5&&j==3) image(enemy,enemyX-2*enemySpace,enemyY+4*enemySpace);
         }
        
           } 
           
        enemyX+=4; //All appear then forward菱形隊形全部出現後加速前進
        if(enemyX-i*enemySpace>=width) {
        enemyX = 0;
        enemyY = random(100,300);
        gameState = 1;
      }
     break;
      }
    
}
//按鍵控制我機
void keyPressed(){
  if(key==CODED){
    switch(keyCode){
      case UP:
        goUp= true;
        break;
      case DOWN:
        goDown= true;
        break;
       case LEFT:
        goLeft= true;
        break;
      case RIGHT:
        goRight= true;
        break;
    }
  }
}

void keyReleased(){
  if(key==CODED){
    switch(keyCode){
      case UP:
        goUp= false;
        break;
      case DOWN:
        goDown= false;
        break;
       case LEFT:
        goLeft= false;
        break;
      case RIGHT:
        goRight= false;
        break;
    }
  }
}
