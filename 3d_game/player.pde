
class Player {
  float xpos;
  float ypos;
  float zpos;
  
  float previous_x;
  float previous_y;
  float previous_z;
  
  //how far the player is rotated in their horizontal view, ie, 0deg= east, 90 deg = north, 
   //180deg = west, 270deg = south, 360deg = east
  float horizontal_vision_degrees;
  float change_in_horizontal_vision_degrees;
  
  //0 deg == down, 90 deg = directly in front of player, 180 deg = up
  float vertical_vision_degrees;
  float change_in_vertical_vision_degrees;
  
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
    
    //0deg == east
    this.horizontal_vision_degrees=90;
    //0 deg == down
    this.vertical_vision_degrees=90;
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
    else {
      left_or_right = "Left";
    }
  
    
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
  
  void adjustVisionDegrees() {
    int x = mouseX;
    int y = mouseY;
  
    //if mouse is on screen
    if (0<x && x<SCREEN_X) {
      if (0<y && y<SCREEN_Y) {
        float hori_difference = x - PREVIOUS_MOUSE_X;
        float verti_difference = y - PREVIOUS_MOUSE_Y;
        
        PREVIOUS_MOUSE_X = x;
        PREVIOUS_MOUSE_Y = y;
      
        hori_difference/=DEGREES_TO_PIXELS_RATIO;
        verti_difference/=DEGREES_TO_PIXELS_RATIO;
        
        this.horizontal_vision_degrees = Math.abs(this.horizontal_vision_degrees-hori_difference);
        this.vertical_vision_degrees = Math.abs(this.vertical_vision_degrees-verti_difference);
        
        //println("H deg: "+horizontal_vision_degrees);
        //println("V deg: "+vertical_vision_degrees);
      }
    }
  
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
 
 
 
 
 
 
 
 
 
 
 
 
