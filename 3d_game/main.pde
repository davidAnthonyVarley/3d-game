 int k;
int colour;

void setup() {
  
  size(800, 800);
  //x, y, z co-ordinates
  player = new Player(5, 5, 2);
  w = new World();
  d = new Display();
  ang = new Angles();
  
  HALF_SCREEN_DEGREES = SCREEN_DEGREES/2;
  
  //place in the middle of the screen
  PREVIOUS_MOUSE_X = SCREEN_X/2;
  PREVIOUS_MOUSE_Y = SCREEN_Y/2;
  
  int j=9;
  int i=9;
  
  if (i==j) { 
  w.setGrid(w.createGrid(11, 11, 26));
  colour=#0000FF;
  
  //createCorridor();
  
  //w.editGrid(0, 1, 0, 2, 10, 12, #AAAA00);
  
  d.findDegreesToPixelsRatio();
  }
  k=0;
   //init();
   frameRate(16); //<>//
}

void draw() {
  background(#444444);
  
  d.drawQuadrants();
  fill(#00A900);

  
  //w.ThreeDimensional_Draw( w.getGrid() );
  //w.editGrid(0, k, 0, 50, 14, 15, #0000FF);
  //HAs_of_cube_line_test();
  //ArrayList<String> block_quadrant = player.findQuadrantOfBlock(bx, by);
  

  
  //XA_HAs_unequal_display();
  //YA_HAs_test();
  
  //d.drawCube(player.xpos, player.ypos, player.zpos+5);
  /*
   //fill(#EEA900);
   d.drawCube(7-k, 7 , 13);
   d.drawCube(2+k ,7, 13);
   d.drawCube(7-k,2, 13);
   d.drawCube(2+k,2, 13);
  //*/
  
  //k++;
  
  ///*
   //fill(#EEA900);
   //d.drawCube(6, 3, 13);
   //d.drawCube(5, 5, 13);
   //d.drawCube(7, 5, 13);
   //d.drawCube(8, 5, 13);
   //d.drawCube(9, 5, 13);
   //d.drawCube(10, 5, 13);
   //d.drawCube(11, 5, 13);
   //d.drawCube(12, 5, 13);
  //*/
  
  //println(ang.calcAngles(7, 10, 9, "Y Axis"));
  //println(ang.calcAngles(7, 13, 9, "Y Axis"));
  
  System.out.println(calcNearHorizontalAngles(player.xpos, player.ypos+1, player.zpos+8, "Z Axis"));
  System.out.println(calcNearHorizontalAngles(player.xpos+5, player.ypos+1, player.zpos+8, "Z Axis"));


  noLoop();
}
