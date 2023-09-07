

int k;
int colour;

void setup() {
  
  size(800, 800);
  //x, y, z co-ordinates
  player = new Player(5, 3, 0);
  w = new World();
  d = new Display();
  ang = new Angles();
  kv = new Key_Value();
  
  HALF_SCREEN_DEGREES = SCREEN_DEGREES/2;
  
  //place in the middle of the screen
  PREVIOUS_MOUSE_X = SCREEN_X/2;
  PREVIOUS_MOUSE_Y = SCREEN_Y/2;
  
  int j=9;
  int i=9;
  
  create_Dict_of_Colours();
  
  if (i==j) { 
    
  try {
    
    //testwrite();
    println("h");
    w.setGrid(w.loadWorld("flat.txt")); //saved_worlds/
    println("h1");
    //fillRemainderOfGrid();
  }
  catch(IOException e) {
    e.printStackTrace();
  }
  
  //createCorridor();
  //createFloor();
  
  
  
  //colour=#0000FF;
  
  //w.editGrid( (int)player.xpos+2, (int)player.xpos+3, (int)player.ypos+2, (int)player.ypos+3, (int)player.zpos+4, (int)player.zpos+5, #00AA00);
  //w.editGrid( 7, 8, 5, 6, 11, 12, #00AA00);
  //createCorridor();
  
  println(w.getGrid().size(), w.getGrid().get(0).size(), w.getGrid().get(0).get(0).size());
  
  //w.editGrid(0, 11, 0, 2, 0, 12, #AAAA00);
  
  findDegreesToPixelsRatio();
  
  }
  k=0;
   //init();
   frameRate(20); //<>//
}

void draw() {
  background(#ADD8E6);
  //background(#777777);
  
  //d.drawQuadrants();
  //fill(#00A900);

  
  w.ThreeDimensional_Draw( w.getGrid() );
  player.drawCrossHairs();
  //cursor();
  
  ///*
  //fill(dict.get("2"));
  
  //fill(-16738048);
  //d.drawCube(7, 7 ,7);
  //println( () dict.get("1"));
  
  //println(kv.getv(kv_dict, "2"));
  //println(kv.getv(kv_dict,"3"));
  //float i = dict.get("3");
  //int f = (int) i;
  
  //fill( i );
  //println(kv.getv(kv_dict,"5"));
  
  //rect(100, 100, 100, 100);
  
  //rect(500, 100, 100, 100);
  //*/
  
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
  
  //println(-1.6738048E7==EMPTY);
  //println(ang.calcAngles(7, 13, 9, "Y Axis"));
  
  //System.out.println(calcNearHorizontalAngles(player.xpos, player.ypos+1, player.zpos+8, "Z Axis"));
  //System.out.println(calcNearHorizontalAngles(player.xpos+5, player.ypos+1, player.zpos+8, "Z Axis"));

  //println(w.getGrid());
  //noLoop();
}
