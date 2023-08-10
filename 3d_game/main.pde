int k;

void setup() {
  
  size(800, 800);
  //x, y, z co-ords
  player = new Player(3, 0, 10);
  w = new World();
  d = new Display();
  ang = new Angles();
  
  HALF_SCREEN_DEGREES = SCREEN_DEGREES/2;
  int j=9;
  int i=9;
  
  if (i==j) {
  w.setGrid(w.createGrid(8, 5, 20));
  
  
  w.editGrid(0, 8, 0, 5, 14, 15, #0000FF);
  w.editGrid(2 , 4, 0, 1, 13, 14, #FF0000);
  w.editGrid(0, 1, 0, 2, 10, 12, #AAAA00);
  
  d.findDegreesToPixelsRatio();
  }
   //init();
   frameRate(1); //<>//
   //p = new PApplet();
   k=0;
   //println(w.getGrid().get(0).size());
  
}

void draw() {

  //w.drawGrid(w.getGrid());
  background(#888888);
  
  //player.changePosition(3, 3 , 3);
  

  
  //d.drawQuad(3, 3, k);
  //d.drawQuad(3, 2, k);
  //d.drawQuad(3, 1, k);
  //k--;
  k++;
  
  d.drawQuadrants();
  w.ThreeDimensional_Draw( w.getGrid() );
  //calcFarHorizontalAngles(0, 1, 10);
  //System.out.println(calcNearVerticalAngles(3, 3, 4) +"\n\n");
  
  /*
  fill(#0000FF);
  d.drawQuad(2, 5, 7);
  d.drawQuad(3, 5, 7);
  
  
  d.drawQuad(2, 1, 7);
  d.drawQuad(3, 1, 7);
  
  fill(#00A900);
  d.drawQuad(2, 2, 7);
  d.drawQuad(3, 2, 7);
  */
  
  //System.out.println(ang.calcHorizontalAngles(player.xpos-2, player.ypos, player.xpos+2));
  //System.out.println(ang.calcHorizontalAngles(player.xpos+2, player.ypos, player.xpos+2));
  
  
  
  //noLoop();
  //d.drawQuad(player.xpos-1, player.ypos+5, player.xpos+10);
  //d.drawQuad(player.xpos, player.ypos+5, player.xpos+10);
  
  noLoop();
  //println(w.getGrid().get(0).size());
  //w.ThreeDimensional_Draw( w.getGrid() );
  
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}
