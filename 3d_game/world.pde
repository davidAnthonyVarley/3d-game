 import java.util.ArrayList;
 
 class World {
   
   
   private ArrayList< ArrayList< ArrayList<Float>>> grid;
   public int[] colours = {#ffffff, #000000, #0000bb};
   
   public ArrayList< ArrayList< ArrayList<Float>>> getGrid() {
     return grid;
   }
   
   public void setGrid(ArrayList< ArrayList< ArrayList<Float>>> grid) {
     this.grid=grid;
     
   }
   
   //x, y, z == dimensions
   //could also be called createWorld
   public ArrayList< ArrayList< ArrayList<Float>>> createGrid(int x, int y, int z) {
    
    //values are stored as floats, and cast to int when drawn
    ArrayList< ArrayList< ArrayList<Float>>> world = new ArrayList< ArrayList< ArrayList<Float>>>();
    
    //world is the 3d array pointer
    
    
    for (int twoD=0; twoD<z; twoD++) {
      //twoD is the 2d array pointer
      world.add(new ArrayList< ArrayList<Float>>());
      
      for (int oneD=0; oneD<x; oneD++) {
        world.get(twoD).add(new ArrayList<Float>());
        //oneD is the 1d array pointer
        
        for (int i=0; i<y; i++) {
          //i is individual index in array
          
          world.get(twoD).get(oneD).add(EMPTY);
          println(twoD+" "+oneD+" "+i);
        }
      }
      println("\n");
    }
    
     return world;
   }
   
   public ArrayList< ArrayList< ArrayList<Float>>> loadWorld(File world_file) {
     //TBC
     return new ArrayList< ArrayList< ArrayList<Float>>>();
   }
   
   
   
   
   
   //access using the world object
   public void editGrid(int x_one, int x_two, int y_one, int y_two, int z_one, int z_two, float colour) {
     
     for (int twoD=z_one; twoD<z_two; twoD++) {
      //twoD is the 2d array pointer
      
      for (int oneD=x_one; oneD<x_two; oneD++) {
        //oneD is the 1d array pointer
        
        for (int i=y_one; i<y_two; i++) {
          //i is individual index in array
          
          this.getGrid().get(twoD).get(oneD).set(i, colour);
          //this.get(twoD).get(oneD).add(colours[0]);
          println(twoD+" "+oneD+" "+i+" has been changed to "+colour);
        }
      }
      println("\n");
    }
     
   }
   
   
   public void drawGrid(ArrayList< ArrayList< ArrayList<Float>>> threeD_grid) {
     
     
     //would be much simpler to call TwoDimensional_Draw several times over, but very slightly less efficient
     
     
     //draw each 2d grid stored in the 3d array, starting from the back
      for (int z_index = grid.size() - 1; z_index>-1; z_index--) {
       
        
        //draw twoD grid
       ArrayList< ArrayList<Float>> grid = threeD_grid.get(z_index);
       int BLOCK_WIDTH = SCREEN_X / grid.size();
       int BLOCK_HEIGHT = SCREEN_Y / grid.get(0).size();
       
       stroke(0);
       int xpos=0;
       int ypos=0;
     
       for (int i = 0; i<grid.size(); i++) {
       
        for (int j=0; j<grid.get(0).size(); j++) {

          float block_colour = grid.get(i).get(j);
        
          //if the current block isn't empty, then draw it
          if (  block_colour!=EMPTY ) {
          
            fill( (int) block_colour);
            rect(xpos, ypos, BLOCK_WIDTH, BLOCK_HEIGHT);
          }
        
          println("x: "+i+", y: "+j+", z: "+z_index+", colour: "+grid.get(i).get(j));
          ypos+=BLOCK_HEIGHT;
        
        }
        xpos+=BLOCK_WIDTH;
        ypos=0;
       
       
       }
       
       
     }
     
     
   }
   
   
   public void TwoDimensional_Draw(ArrayList< ArrayList<Float>> grid, int z_index) {
     
    int BLOCK_WIDTH = SCREEN_X / grid.size();
    int BLOCK_HEIGHT = SCREEN_Y / grid.get(0).size();
     
     //println("column length: "+grid.get(0).size());
     //println(
     
     
     stroke(0);
     int xpos=0;
     int ypos=0;
     
     for (int i = 0; i<grid.size(); i++) {
       
      for (int j=0; j<grid.get(0).size(); j++) {

        float block_colour = grid.get(i).get(j);
        
        //if the current block isn't empty, then draw it
        if (  block_colour!=EMPTY ) {
          
          fill( (int) block_colour);
          rect(xpos, ypos, BLOCK_WIDTH, BLOCK_HEIGHT);
        }
        
        println("x: "+i+", y: "+j+", z: "+z_index+", colour: "+grid.get(i).get(j));
        ypos+=BLOCK_HEIGHT;
        
      }
      xpos+=BLOCK_WIDTH;
      ypos=0;
       
       
     }
   }
   
   //ie, draw the entire world
   public void ThreeDimensional_Draw(ArrayList< ArrayList< ArrayList<Float>>> grid) {
     
     //draw from the back
     for (int i = grid.size() - 1; i>-1; i--) {
       TwoDimensional_Draw(grid.get(i), i);
     }
   
 }
 
 
 
 }
 
 
 
 
 
 
 
 
