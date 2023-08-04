static ArrayList<Float> nearVerticalAngles;
  
  public void init() {
    nearVerticalAngles = new ArrayList<Float>();
    float num = 5000;
    
    nearVerticalAngles.add(num);
    nearVerticalAngles.add(num);
    
  }
  
  //e1 and g1 will be related to near vertical angle,
  //e2 and g2 will be related to far vertical angle
  //look at documentation in calcNearVerticalAngle to understand
  static float e_one;
  static float e_two;
  static float g_one;
  static float g_two;
  
  //i have saved as ints because doubles will take up more space
  //however, this adds an extra 3 unneccessary commands 
  public static ArrayList<Float> calcNearVerticalAngles(float block_x, float block_y, float block_z) {
    
    
    println("NV called");
    /*
     calculate the hypotenuse of the first RA triangle between player (x, z) and block (x, z)
       b
     ------ (bx, bz)
     |    /
    a   |   / 
     |  / c
     | /
     |/
     (player x, player z)
     
     
     */
    
    //since the numerically lowest co-ords will be (0, 0, 0)
    //there is no need to change every co-ord to its abs value
    
    float a = Math.abs(block_z-player.zpos);
    float b = Math.abs(block_x-player.xpos);
    float c = (float) Math.sqrt( (a*a) + (b*b) );
    
    
    /*
     calculate the hypotenuse of the second RA triangle between player y and block y
       
              
    
          
        / |
       /  |                  (by)
      /  |                  /
    c  /  |  a                   /  |
      /      |                  /     |
     /    |             e /        |d
    /_______|            /          |
        b                 /______________|
                      c    (player y)  
    
     
     */
    
    
    float d = Math.abs(block_y -player.ypos -1); //we want the angle from the bottom to top of block, so -1
    float e = (float) Math.sqrt( (c*c) + (d*d) );
    
    //e, d, c == RA triangle
    //use law of Sines to find angle D, angle E ==90deg
    float angleD = ang.findSin(d, e, 90);
    
    
    
    
    
    float f = d+1;
    float g = (float) Math.sqrt( (c*c) + (f*f) );
    
    //e_one=e;
    //g_one=g;
    /*
     * 
     *     / |                 /|        
       /  |                 /  |h==1
    c  /  |            g   /   /|
       /  |  a               /    / |  f
      /      |               /   /    |
     /    |             / e /      |
    /_______|           / /        |
       b                     /______________|
                      c    
     */
    
    //now find angle using law of Cosines
    
    //g = hypotenuse
    //e = adjacent
    //h = opposite = 1, because every block is 1x1x1
    
    //cos(A) = (b^2 + c^2 - a^2) / (2 * b * c)
    float h=1;
    float angleE = ang.findCos(e, g, h);
    float angleF = 45- angleD - angleE;
    angleD+=45;
    
    ArrayList<Float> nv_angles = new ArrayList<Float>();
    println(angleD);
    println(angleE);
    println(angleF);

    
    
    return nv_angles;
    
  }
  
  public static ArrayList<Float> calcFarVerticalAngles(float block_x, float block_y, float block_z) {
    
  
    /*
     calculate the hypotenuse of the first RA triangle between player (x, z) and block (x, z)
       b
     ------ (bx, bz)
     |    /
    a   |   / 
     |  / c
     | /
     |/
     (player x, player z)
     
     
     */
    
    //since the numerically lowest co-ords will be (0, 0, 0)
    //there is no need to change every co-ord to its abs value
    
    float a = Math.abs(block_z-player.zpos);
    float b = Math.abs(block_x-player.xpos+1);
    float c = (float) Math.sqrt( (a*a) + (b*b) );
    
    
    /*
     calculate the hypotenuse of the second RA triangle between player y and block y
       
              
    
          
        / |
       /  |                  (by)
      /  |                  /
    c  /  |  a                   /  |
      /      |                  /     |
     /    |             e /        |d
    /_______|            /          |
        b                 /______________|
                      c    (player y)  
    
     
     */
    
    
    float d = Math.abs(block_y -player.ypos-1); //we want the angle from the bottom to top of block, so -1
    float e = (float) Math.sqrt( (c*c) + (d*d) );
    
    //e, d, c == RA triangle
    //use law of Sines to find angle D, angle E ==90deg
    float angleD = ang.findSin(d, e, 90);
    
    
    
    
    
    float f = d+1;
    float g = (float) Math.sqrt( (c*c) + (f*f) );
    
    //e_one=e;
    //g_one=g;
    /*
     * 
     *     / |                 /|        
       /  |                 /  |h==1
    c  /  |            g   /   /|
       /  |  a               /    / |  f
      /      |               /   /    |
     /    |             / e /      |
    /_______|           / /        |
       b                     /______________|
                      c    
     */
    
    //now find angle using law of Cosines
    
    //g = hypotenuse
    //e = adjacent
    //h = opposite = 1, because every block is 1x1x1
    
    //cos(A) = (b^2 + c^2 - a^2) / (2 * b * c)
    float h=1;
    float angleE = ang.findCos(e, g, h);
    float angleF = 45- angleD - angleE;
    angleD+=45;
    
    ArrayList<Float> fv_angles = new ArrayList<Float>();
    fv_angles.add(angleD);
    fv_angles.add(angleE);
    fv_angles.add(angleF);
    
    
    return fv_angles;
    
  }
  
  
  
  public ArrayList< ArrayList<Float>> calcVerticalAngles(float block_x, float block_y, float block_z) {
    //angle documentation is above
    
    
    //if (nearVerticalAngles.get(1)==5000) {
    //  nearVerticalAngles= calcNearVerticalAngles(block_x, block_y, block_z);
    //}
    
    ArrayList<Float> NV = calcNearVerticalAngles(block_x, block_y, block_z);
    
    
    ArrayList< ArrayList<Float>> VAs = new ArrayList<ArrayList<Float>>();
    VAs.add(NV);
    VAs.add(calcFarVerticalAngles(block_x, block_y, block_z));
    
    
    
    return VAs;
  }
  
  
  
  
  
  
  
  
  
  
