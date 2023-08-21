
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
    
  
  
  
  
}
