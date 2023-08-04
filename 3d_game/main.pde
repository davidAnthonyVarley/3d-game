

void setup() {
  
  size(800, 800);
  //x, y, z co-ords
  player = new Player(0, 0, 0);
  w = new World();
  d = new Display();
  ang = new Angles();
  
  
  int j=1;
  int i =2;
  
  if (i==j) {
  w.setGrid(w.createGrid(5, 5, 5));
  
  
  w.editGrid(0, 5, 0, 5, 4, 5, #0000FF);
  
  w.editGrid(2 , 4, 0, 1, 3, 4, #FF0000);
  w.editGrid(0, 1, 0, 2, 0, 2, #AAAA00);
  }
   //init();
   d.findDegreesToPixelsRatio();
   frameRate(1); //<>//
   //p = new PApplet();
   
   //println(w.getGrid().get(0).size());
  
}

void draw() {

  //w.drawGrid(w.getGrid());
  background(#888888);
  
  d.drawQuad(3, 1, 3);
  d.drawQuad(2, 1, 3);
  d.drawQuad(1, 1, 3);
  
  
  noLoop();
  //println(w.getGrid().get(0).size());
  //w.ThreeDimensional_Draw( w.getGrid() );
  
}
