int k;
int colour;

void setup() {
  
  size(800, 800);
  //x, y, z co-ordinates
  player = new Player(5, 5, 0);
  w = new World();
  d = new Display();
  ang = new Angles();
  
  HALF_SCREEN_DEGREES = SCREEN_DEGREES/2;
  int j=9;
  int i=9;
  
  if (i==j) {
  w.setGrid(w.createGrid(11, 11, 26));
  colour=#0000FF;
  
  createCorridor();
  
  //w.editGrid(0, 1, 0, 2, 10, 12, #AAAA00);
  
  d.findDegreesToPixelsRatio();
  }
  k=0;
   //init();
   frameRate(1); //<>//
   //p = new PApplet();
   
   //println(w.getGrid().get(0).size());
}

void draw() {
  background(#444444);
  //w.drawGrid(w.getGrid());
  
  
  //player.changePosition(5, 5 , 0);
  

  
  //d.drawQuad(3, 3, k);
  //d.drawQuad(3, 2, k);
  //d.drawQuad(3, 1, k);
   //k--;
  //k++;
  
  d.drawQuadrants();
  fill(#00A900);
  //d.drawCube(10, 5, 14);
  
  w.ThreeDimensional_Draw( w.getGrid() );
  //w.editGrid(0, k, 0, 50, 14, 15, #0000FF);
  //calcFarHorizontalAngles(0, 1, 10);
  //System.out.println(calcNearVerticalAngles(3, 3, 4) +"\n\n");
  //k--;
  
  /*
  d.drawCube(8, 7+k, 21);
  d.drawCube(1 ,7+k, 21); 
  d.drawCube(8 ,3-k, 21);
  d.drawCube(1 ,3-k, 21);
  //*/
  
  /*
   //fill(#EEA900);
   d.drawCube(7-k, 7 , 13);
   d.drawCube(2+k ,7, 13);
   d.drawCube(7-k,2, 13);
   d.drawCube(2+k,2, 13);
  //*/
  
  k++;
  
  //println(ang.calcAngles(7, 10, 9, "Y Axis"));
  //println(ang.calcAngles(7, 13, 9, "Y Axis"));
  
  //System.out.println(calcFarHorizontalAngles(10, 7, 10, "Y Axis"));
  //System.out.println(calcNearHorizontalAngles(10, 7, 11, "Z Axis"));
  
  //drawZAStack();
  //drawYAStack();
  //drawXAStack();
  //nHA_YA_test();
  
  
  //System.out.println(ang.calcHorizontalAngles(10, 15, 20, "X Axis"));

  noLoop();
  //d.drawQuad(player.xpos-1, player.ypos+5, player.xpos+10);
  //d.drawQuad(player.xpos, player.ypos+5, player.xpos+10);
  
  
  //println(w.getGrid().get(0).size());
  //w.ThreeDimensional_Draw( w.getGrid() );
  
}


void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}
