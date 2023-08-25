
class Player {
  float xpos;
  float ypos;
  float zpos;
  
  float previous_x;
  float previous_y;
  float previous_z;
  
  /*
  north/forward = z+
  east/right = x+
  west/left = x-
  south/backward = z-
  */
  
  
  public Player (float x, float y, float z) {
    this.xpos = x;
    this.ypos= y;
    this.zpos = z;
  }
  
  public void changePosition(float x, float y, float z) {
    this.previous_x = this.xpos;
    this.previous_y = this.ypos;
    this.previous_z = this.xpos;
    
    this.xpos = x;
    this.ypos= y;
    this.zpos = z;
  }
  
  
  public  ArrayList<String> findQuadrantOfBlock(float bx, float by) {
    String left_or_right="";
    String higher_or_lower;
    if (this.xpos <= bx) {
      left_or_right = "Right";
    }
    else {//if (this.xpos > bx) {
      left_or_right = "Left";
    }
    /*
    else {
      if (this.previous_x < this.xpos) {
        left_or_right = "Left";
      }
      else if (this.previous_x > this.xpos) {
        left_or_right = "Right";
      }
    }
    */
    
    if (this.ypos <= by) {
      higher_or_lower = "Higher";
    }
    else {
      higher_or_lower = "Lower";
    }
    //println(left_or_right, higher_or_lower);
    
    ArrayList<String> quadrant = new ArrayList<String>();
    quadrant.add(left_or_right);
    quadrant.add(higher_or_lower);
    
    
    return quadrant;
    
  }
  
  
  
  //if the side of the block isn't covered by another block,ie,
  //dont display the top of a block in the lower-left quadrant
  //if there's a block directly above it
  
  //if we want to display the quad, return false
  public boolean isQuadCovered(float bx, float by, float bz, String direction, ArrayList<String> block_quadrant) {
    
    //------------------------------------------
    if (direction.equals("X Axis")) {
      if (bx!=0 && (bx!=w.getGrid().get(0).size()) ) {
        bx = block_quadrant.get(0).equals("Right") ? bx-1 : bx+1;
      }
    }
    //------------------------------------------
    
    
    
    //------------------------------------------
    else if (direction.equals("Y Axis")) {
      if (by!=0 && (by!=w.getGrid().get(0).get(0).size()) ) {
        by = block_quadrant.get(1).equals("Higher") ? (by-1) : by+1;
      }
    }
    //------------------------------------------
    
    
    
    //------------------------------------------
    else if (direction.equals("Z Axis")) {
      if (bz!=0) {
        bz-=1;
      }
    }
    //------------------------------------------
    
    float block = w.getBlock(bx, by, bz);

    if (block==EMPTY) {
      return false;
    }
    else {
      return true;
    }
    
  }



 }
 
 
