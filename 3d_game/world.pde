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
          //println(twoD+" "+oneD+" "+i);
        }
      }
      //println("\n");
    }
    
     return world;
   }
   
   public ArrayList< ArrayList< ArrayList<Float>>> loadWorld(String world_filepath) throws IOException {
    
     //load txt file with 1 line
    String[] line = loadStrings(world_filepath);
    String data = line[0];
    println(data);
    
    //split into data and dimensions
    String[] split = data.split(",");
    String dimensions = split[0];
    String text = split[1];
    
    
    //println(dimensions);
    //println(text);
    
    String[] d = dimensions.split("-");
    
    //println("dimensions: "+ dimensions);//+" "+ d[1]+" "+d[2]);
    
    
    int x_length = Integer.parseInt(d[0]);
    int y_width = Integer.parseInt(d[1]);
    int z_depth = Integer.parseInt(d[2]);
    
    
    
    
    // - to separate between columns in a row
    // -- to separate between rows in a table
    // --- to seperate between different tables
    
    ArrayList< ArrayList< ArrayList<Float>>> grid = createGrid(x_length, y_width, z_depth);
    //all tables will have equal num of rows and columns
    
    //text = br.readLine(); // will not have any \n or \r to terminate line, so this reads the whole file
    
    //pretend this is the whole file, with z size = 2, x size = 2, y size = 3
    // 1-2-3--3-2-1---4-5-6--6-5-4
    
    // [1-2-3--3-2-1---4-5-6--6-5-4] grid
    // [1-2-3--3-2-1], [4-5-6--6-5-4] three
    // [1-2-3], [3-2-1]two
    // [1], [2] one
    
    
    String[] three = text.split("---");
    
    
    //split 3d into 2d
    for (int z=0; z<three.length; z++) {
      //grid.add(new ArrayList<  ArrayList<Float>>()); //2D
      // 1-2-3--3-2-1
      String[] two = three[z].split("--");
      

      //split 2d into 1d
      for (int x=0; x<two.length; x++) {
        
        //String m = two[x];
        //grid.get(z).add(new ArrayList<Float>()); //1D ARRAY
        // 1-2-3
        String[] one = two[x].split("-");
        
        
        //split 1d into elements
        for (int y=0; y<one.length; y++) { //element
          //1
          
          //String n = one[x];
          //add elements to float array
          String keyy = one[y];
          float value = dict.get(keyy);//Float.parseFloat(num);
          
          
          grid.get(z).get(x).set(y, value);
          
          //System.out.println("x: "+x+", y: "+y+", z: "+z+",    key:value -> "+key+":"+value );
          
          //now, do i draw here, or simply load and then call createWorld(grid)?
        }
      }
      //System.out.println();
    }
    
    //br.close();
    //now, i have loaded the individual values in, now time for dict and key-value pairs
    
    //println(grid);
    return grid;
    
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
          //println(twoD+" "+oneD+" "+i+" has been changed to "+colour);
        }
      }
      //println("\n");
    }
     
   }
   
   public float getBlock(float x, float y, float z) {
     
     //use this to see block is empty or full
     try {
       float block = w.getGrid().get( (int) z).get( (int) x).get( (int) y);
       return block;
     }
     catch (IndexOutOfBoundsException e) {
      return 15;
    }
    
    
   }
   
   
   /*
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
   //*/
   
   /*
   //dont need to ret anything as passing in reference
   void setGridSize(ArrayList< ArrayList< ArrayList<Float>>> grid, float x_length, float y_width, float z_depth) {
     
     for (int twoD=0; twoD<z_depth; twoD++) {
      //twoD is the 2d array pointer
      grid.add(new ArrayList< ArrayList<Float>>());
      
      for (int oneD=0; oneD<x_length; oneD++) {
        //oneD is the 1d array pointer
        grid.get(twoD).add(new ArrayList<Float>());
        
        for (int i=0; i<y_width; i++) {
          //i is individual index in array
          
          this.getGrid().get(twoD).get(oneD).set(i, colour);
          //this.get(twoD).get(oneD).add(colours[0]);
          //println(twoD+" "+oneD+" "+i+" has been changed to "+colour);
        }
      }
      println("\n");
    }
     
   }
   */
   
   public void TwoDimensional_Draw(ArrayList< ArrayList<Float>> grid, int z_index) {
     
     stroke(0);
     //noStroke();
     
     //for quadrant A, draw left>right, top>bottom
     for (int i = 0; i<player.xpos; i++) {     
      for (int j=0; j<=player.ypos; j++) {
        //float block_colour = grid.get(i).get(j);
        check_space(grid.get(i).get(j), i, j, z_index); 
      }
     }
     
     //for quadrant B, draw right>left, top>bottom
     for (int i = grid.size()-1; i>=player.xpos; i--) {     
      for (int j=0; j<=player.ypos; j++) {
        //float block_colour = grid.get(i).get(j);
        check_space(grid.get(i).get(j), i, j, z_index); 
      }
     }
     
     //for quadrant C, draw left>right, bottom>top
     for (int i = 0; i<player.xpos; i++) {     
      for (int j=grid.get(0).size()-1; j>player.ypos; j--) {
        //float block_colour = grid.get(i).get(j);
        check_space(grid.get(i).get(j), i, j, z_index); 
      }
     }
     
     //for quadrant D, draw right>left, bottom>top
     for (int i = grid.size()-1; i>=player.xpos; i--) {     
      for (int j=grid.get(0).size()-1; j>player.ypos; j--) {
        //float block_colour = grid.get(i).get(j);
        check_space(grid.get(i).get(j), i, j, z_index); 
      }
     }
     
     
     
   }
   
   void check_space(float block_colour, float x, float y, float z) {
        //if the current block isn't empty, then draw it
        
        //println(x, y, z, block_colour);
        if (  block_colour!=EMPTY ) {
          
          
          //float f = block_colour;
          //int i = (int) f;
          
          //println(i);
          
          fill( (int) block_colour);
          d.drawCube(x, y, z);
        }  
     
   }
   
   boolean blockIsVisible(float x, float y, float z){
     //x<=z && y<=z
     
     ///*
     if (x<=z && y<=z)
       return true;
     else
       return false;
       //*/
       //return true;
   }
   
   //ie, draw the entire world
   public void ThreeDimensional_Draw(ArrayList< ArrayList< ArrayList<Float>>> grid) {
     
     //draw from the back
     for (int i = grid.size() - 1; i>player.zpos-1; i--) {
       TwoDimensional_Draw(grid.get(i), i);
     }
     
   
 }
 

   
 
 
 
 }
 
 
 
 
 
 
 
 
