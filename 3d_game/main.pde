int k;
int colour;

void setup() {
  
  size(800, 800);
  //x, y, z co-ords
  player = new Player(0, 0, 0);
  w = new World();
  d = new Display();
  ang = new Angles();
  
  HALF_SCREEN_DEGREES = SCREEN_DEGREES/2;
  int j=9;
  int i=9;
  
  if (i==j) {
  w.setGrid(w.createGrid(20, 20, 30));
  colour=#0000FF;
  
  w.editGrid(0, 10, 0, 10, 14, 15, #00A0FF);
  //w.editGrid(2 , 4, 0, 1, 13, 14, #FF0000);
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

  //w.drawGrid(w.getGrid());
  background(#666666);
  
  player.changePosition(5, 5 , 0);
  

  
  //d.drawQuad(3, 3, k);
  //d.drawQuad(3, 2, k);
  //d.drawQuad(3, 1, k);
   //k--;
  //k++;
  
  d.drawQuadrants();
  fill(#00A900);
  //d.drawCube(10, 5, 14);
  
  //w.ThreeDimensional_Draw( w.getGrid() );
  //w.editGrid(0, k, 0, 50, 14, 15, #0000FF);
  //calcFarHorizontalAngles(0, 1, 10);
  //System.out.println(calcNearVerticalAngles(3, 3, 4) +"\n\n");
  //k--;
  
  /*
  d.drawCube(8, 7+k, 21);
  d.drawCube(4 ,7-k, 21);
  d.drawCube(8 ,3+k, 21);
  d.drawCube(4 ,3-k, 21);
  //*/
  
  ///*
   //fill(#EEA900);
   d.drawCube(6-k, 2 , 21);
   d.drawCube(3+k ,2, 21);
   d.drawCube(6-k,2, 21);
   d.drawCube(3+k,2, 21);
  //*/
  
  k++;
  
  System.out.println(calcNearVerticalAngles(6.0, 5.0, 21.0, "Z Axis"));
  System.out.println(calcNearVerticalAngles(6.0, 4.0, 21.0, "Z Axis"));
  
  
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
