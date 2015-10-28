//You should implement your assign3 here.
PImage  bg1, bg2,enemy,fighter,hp,treasure;
float bg1X,bg2X,fighterX,fighterY,treasureX,treasureY,enemyX,enemyY,speedX,speedY,enemySpace;
int gameState,i=0,j=0;

void setup(){
 bg1 = loadImage("img/bg1.png");
 bg2 = loadImage("img/bg2.png");
 enemy = loadImage("img/enemy.png");
 fighter = loadImage("/img/fighter.png");
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
 enemySpace=66;
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
  rect(35,35,200,25);
  image(hp,30,30);
  //treasure appears
  image(treasure,treasureX,treasureY);
  //fighter apears
  image(fighter,fighterX,fighterY);
  
  switch(gameState){
    
    case 1:
      for(i=0;i<5;i++){
        image(enemy,enemyX-i*enemySpace,enemyY);
        enemyX+=1;
      }
      if(enemyX-i*enemySpace>=width) {
        enemyX = 0;
        enemyY = random(20,150);
        gameState = 2;
      }
      break;
      
     
    case 2:
       for(i=0;i<5;i++){
         image(enemy,enemyX-i*enemySpace,enemyY+i*enemySpace);
         enemyX+=1;
       }
       if(enemyX-i*enemySpace>=width) {
        enemyX = 0;
        enemyY = random(20,100);
        gameState = 3;
      }
      break;
       
     case 3:
       for(i=1;i<=5;i++){
        for(j=1;j<=5;j++){
         if(i==1&&j==3) image(enemy,enemyX-2*enemySpace,enemyY);
         if(i==2&&j==2) image(enemy,enemyX-3*enemySpace,enemyY+enemySpace);
         if(i==2&&j==4) image(enemy,enemyX-1*enemySpace,enemyY+enemySpace);
         if(i==3&&j==1) image(enemy,enemyX-4*enemySpace,enemyY+2*enemySpace);
         if(i==3&&j==5) image(enemy,enemyX,enemyY+2*enemySpace);
         if(i==5&&j==3) image(enemy,enemyX-2*enemySpace,enemyY+4*enemySpace);
         if(i==4&&j==2) image(enemy,enemyX-3*enemySpace,enemyY+3*enemySpace);
         if(i==4&&j==4) image(enemy,enemyX-1*enemySpace,enemyY+3*enemySpace);}
         enemyX+=1;
        }
        if(enemyX-i*enemySpace>=width) {
        enemyX = 0;
        enemyY = random(100,300);
        gameState = 1;
      }
     break;
      }
   
  
  
}
