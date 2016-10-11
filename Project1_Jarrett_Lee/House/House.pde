int hill_g = (200);
int hill_g_shade = (255);
float mist_opacity = 0;
int moveX,moveY;
float dew_opacity = 0;
int wipe_y = 0;
float lose_mist_opacity = 1;
int x;
int y;


float time;
float increase_time;

void setup(){
  moveX = 0;
  moveY = 0;
  size(790,790);
  background(135,206,235);  
  frameRate(60);
}




void draw(){

background(135,206,235);  
  time = millis();
// time function to increase mist
if(time > 1000){
  increase_time = increase_time + 1;
  time = time - 1000;
}
if (increase_time / 2 == 1){ 
  if(increase_time == 2){
    mist_opacity = mist_opacity + 0.5;  
    increase_time = increase_time - 2;
    if (mist_opacity > 220){
      mist_opacity = 220;
    }//stop mist at certain point
  }// increasing mist
}// timer
//end of pressedkey
if (keyPressed) {
 
  if (key == 'c' || key == 'C'){
   time = 0;
   increase_time = 0;
   mist_opacity = mist_opacity - lose_mist_opacity;
   wipe_y = wipe_y + 5;
   if(mist_opacity < 60){
     wipe_y = wipe_y - 10; 
   }// send wiper back up
 }// function for key 'c' being pressed to wipe and clear
}//end of keypressed


//reset wiper 
if(wipe_y >800){
 wipe_y = 0; 
}

//hills 
  noStroke();
  fill(1,hill_g,17);
  ellipse(100, 670, 400, 250);
  ellipse(300, 635, 300, 300);
  ellipse(500, 660, 300, 300);  
  ellipse(700, 700, 300, 300);

  fill(1,hill_g_shade,17);

  ellipse(150, 760, 400, 250);
  ellipse(350, 725, 300, 300);
  ellipse(550, 750, 300, 300);  
  ellipse(750, 790, 300, 300);


//cloud set 1
  fill(255,60);
  ellipse(moveX-260, moveY, 200, 200);
  ellipse(moveX-230, moveY+20, 200, 200);
  ellipse(moveX-200, moveY+60, 200, 200);  
  ellipse(moveX-230, moveY+20, 300, 200);  
  ellipse(moveX-260, moveY, 300, 200);  

  ellipse(moveX-260, moveY, 230, 200);
  ellipse(moveX-230, moveY+20, 250, 200);
  ellipse(moveX-200, moveY+60, 200, 180);  
  ellipse(moveX-230, moveY+20, 300, 150);  
  ellipse(moveX-260, moveY, 300, 150);    
  
//cloud set 2
  ellipse(moveX-360, moveY+100, 100, 200);
  ellipse(moveX-330, moveY+120, 200, 200);
  ellipse(moveX-300, moveY+160, 100, 200);  
  ellipse(moveX-330, moveY+120, 300, 200);  
  ellipse(moveX-360, moveY+100, 300, 200);  

  ellipse(moveX-360, moveY+100, 100, 200);
  ellipse(moveX-330, moveY+120, 200, 200);
  ellipse(moveX-300, moveY+160, 100, 200);  
  ellipse(moveX-330, moveY+120, 300, 200);  
  ellipse(moveX-360, moveY+100, 300, 200);  

//cloud set 3
  ellipse(moveX-460, moveY+600, 200, 200);
  ellipse(moveX-430, moveY+620, 200, 200);
  ellipse(moveX-400, moveY+660, 200, 200);  
  ellipse(moveX-430, moveY+620, 100, 200);  
  ellipse(moveX-460, moveY+600, 300, 200);  

  ellipse(moveX-500, moveY+620, 200, 200);
  ellipse(moveX-450, moveY+640, 200, 200);
  ellipse(moveX-400, moveY+690, 200, 200);  
  ellipse(moveX-450, moveY+640, 100, 200);  
  ellipse(moveX-500, moveY+620, 300, 200);  

//cloud set 4
  ellipse(moveX-760, moveY+300, 200, 200);
  ellipse(moveX-730, moveY+320, 200, 200);
  ellipse(moveX-700, moveY+360, 200, 200);  
  ellipse(moveX-730, moveY+320, 300, 200);  
  ellipse(moveX-760, moveY+300, 300, 200);  

  ellipse(moveX-790, moveY+320, 100, 200);
  ellipse(moveX-745, moveY+340, 200, 100);
  ellipse(moveX-700, moveY+380, 200, 200);  
  ellipse(moveX-745, moveY+340, 200, 200);  
  ellipse(moveX-790, moveY+320, 300, 200);  
  
  
  moveX++;
//make the clouds move and reset  
if (moveX > 1750){  
  moveX = 0;
  moveY = moveY + 140;
}
  

  
  
//wiper
fill(0);
rect(0, wipe_y, 800, 20);

  
// window fog
fill(255,mist_opacity );
  rect(-100,-100,1000,1000);  
  

// window frame
  strokeWeight(40);
  stroke(0); // shadow
  line(0,10,795,10); //top bar
  line(10,0,10,795); //left bar
  line(0,795,795,0); // bottom bar
  line(-10,-10,805,805); // topleft/ bottom right
  line(25,10,815,805); // cross bar
  line(770,0,770,770); // right bar

  stroke(139,69,19); // frame coloring
  line(0,0,775,0);
  line(0,0,0,775);
  line(0,775,775,0);
  line(0,0,775,775);
  line(0,775,775,775);
  line(775,0,775,775);

  stroke(222,184,135,35); // shading
  line(0,0,800,0);
  line(0,0,0,800);
  line(0,785,800,-15);
  line(-10,0,790,800);
  line(0,800,800,800);
  line(800,0,800,800);
  
dew_opacity = mist_opacity / 4;  
  
fill(3, 74, 236,dew_opacity);
drawRaindrop(120,120,7);

}

void drawRaindrop(int x,int y,int size){
    noStroke();
    for (int i = 2; i < size; i++ ) {
      ellipse(x+100,140 + i*4,i*2,i*2);
      ellipse(x+250,470 + i*4,i*2,i*2);
      ellipse(x+100,260 + i*4,i*2,i*2);
      ellipse(x+130,340 + i*4,i*2,i*2);
      ellipse(x+50,700 + i*4,i*2,i*2);
      ellipse(x+400,600 + i*4,i*2,i*2);
      ellipse(x+630,340 + i*4,i*2,i*2);
      ellipse(x+640,670 + i*4,i*2,i*2);
      ellipse(x+560,600 + i*4,i*2,i*2);
      ellipse(x+630,340 + i*4,i*2,i*2);
      ellipse(x+600,650 + i*4,i*2,i*2);
      ellipse(x+500,450 + i*4,i*2,i*2);
}

}