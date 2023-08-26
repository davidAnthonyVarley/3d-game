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
  /*
  static float e_one;
  static float e_two;
  static float g_one;
  static float g_two;
  */
  
  public static ArrayList<Float> calcNearVerticalAngles(float block_x, float block_y, float block_z, String direction) {
    
    
    //println("NV called");
    /*
     calculate the hypotenuse of the first RA triangle between player (x, z) and block (x, z)
       b
     ------ (bx, bz)
     |    /
    a|   / 
     |  / c
     | /
     |/
     (player x, player z)
     
     
     */
    
    //since the numerically lowest co-ords will be (0, 0, 0)
    //there is no need to change every co-ord to its abs value
    
    ArrayList<Float> lines = findTriangle_VerticalAngles(block_x,  block_y,  block_z, direction, "Near");
    float a = lines.get(0);//(float) Math.sqrt( (a*a) + (b*b) );
    float b = lines.get(1);//Math.abs(bx - player.xpos);
    float c = lines.get(2);//(float) Math.sqrt( (a*a) + (b*b) );
    
    
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
    
    
    float d = lines.get(3);//Math.abs(block_y -player.ypos) -1; //we want the angle from the bottom to top of block, so -1
    float e = (float) Math.sqrt( (c*c) + (d*d) );
    
    //e, d, c == RA triangle
    //use law of Sines to find angle D, angle E ==90deg
    float angleD = ang.findSin(d, e, 90);
    
    
    float f = lines.get(4);
    float g =  lines.get(5);
    if (g==5000000) {
     g = ang.findHypotenuse(c, f);
    }
    println(a, b, c, d, e, f, g);
    
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
    float angleE;// = ang.findCos(e, g, 1);
    
    if (direction.equals("Y Axis")) {
      //a== z distance
      //float perim = ang.findHypotenuse(a, a);
      //e2 = distance from player to cirference of circle
      //float e_two = ang.findHypotenuse(perim, b);
      //float h = Math.abs(a-d);
      
      
      float D_two = ang.findSin(d, g, 90);
      angleE= Math.abs(D_two - angleD);
    } 
    else {
      angleE= ang.findCos(e, g, 1);
    }
    float angleF= Math.abs(HALF_SCREEN_DEGREES - angleD - angleE);

    angleD+= HALF_SCREEN_DEGREES;
    
    ArrayList<Float> nv_angles = new ArrayList<Float>();
    nv_angles.add(angleD);
    nv_angles.add(angleE);
    nv_angles.add(angleF);

    
    
    return nv_angles;
    
  }
  
  public static ArrayList<Float> calcFarVerticalAngles(float block_x, float block_y, float block_z, String direction) {
    
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
    
     ArrayList<Float> lines = findTriangle_VerticalAngles(block_x,  block_y,  block_z, direction, "Far");
    //float a = Math.abs(block_z-player.zpos);
    //float b = Math.abs(block_x-player.xpos+1);
    float c = lines.get(2);//(float) Math.sqrt( (a*a) + (b*b) );
    
    
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
    
    
    float d = lines.get(3);//Math.abs(block_y -player.ypos) -1; //we want the angle from the bottom to top of block, so -1
    float e = (float) Math.sqrt( (c*c) + (d*d) );
    
    //e, d, c == RA triangle
    //use law of Sines to find angle D, angle E ==90deg
    float angleD = ang.findSin(d, e, 90);
    
    
    
    
    
    float f = lines.get(4);
    float g =  lines.get(5);
    if (g==5000000) {
     g = ang.findHypotenuse(c, f);
    }
    
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
    float angleE;// = ang.findCos(e, g, 1);
    
    if (direction.equals("Y Axis")) {
      //a== z distance
      //float perim = ang.findHypotenuse(a, a);
      //e2 = distance from player to cirference of circle
      //float e_two = ang.findHypotenuse(perim, b);
      //float h = Math.abs(a-d);
      
      
      float D_two = ang.findSin(d, g, 90);
      angleE= Math.abs(D_two - angleD);
    } 
    else {
      angleE= ang.findCos(e, g, 1);
    }
    float angleF= Math.abs(HALF_SCREEN_DEGREES - angleD - angleE);

    angleD+= HALF_SCREEN_DEGREES;
    
    ArrayList<Float> fv_angles = new ArrayList<Float>();
    fv_angles.add(angleD);
    fv_angles.add(angleE);
    fv_angles.add(angleF);
    
    
    return fv_angles;
    
  }
  
  
  
  public ArrayList< ArrayList<Float>> calcVerticalAngles(float block_x, float block_y, float block_z, String direction) {
    //angle documentation is above
    
    
    //if (nearVerticalAngles.get(1)==5000) {
    //  nearVerticalAngles= calcNearVerticalAngles(block_x, block_y, block_z);
    //}
    
    
    ArrayList< ArrayList<Float>> VAs = new ArrayList<ArrayList<Float>>();
    VAs.add(calcNearVerticalAngles(block_x, block_y, block_z, direction));
    VAs.add(calcFarVerticalAngles(block_x, block_y, block_z, direction));
    
    
    
    return VAs;
  }
  
  //draw the first triangle needed to draw a line to a block
  public static ArrayList<Float> findTriangle_VerticalAngles(float block_x, float block_y, float block_z, String direction, String nearORfar_angle) {
    
    /*    THIS IS THE NET OF A 3D CUBE
     *            ____
              |6   |
              |____|
     *      ____     ____        ____
        |4   |    |  3 |    |5   |
        |____|    |____|    |____|
     *            ____
              |   |
              |__1_|
     *            ____
              |   |
              |_2__|                            

     * 
     *  if you are directly opposite and level with the cube, facing south to north, you will see 1.
     *  facing north to south, you will see 6
     * 
     * 1 faces the negative z axis, 6 faces the positive z axis
     * 4 faces the negative x axis, 5 faces the positive x axis
     * 2 faces the negative y axis, 3 faces the positive y axis




     * this is the triangle drawn if you are drawing 
     * in the z direction, ie, 1 or 6

         b
     ------ (bx, bz)
     |    /
    a   |   / 
     |  / c
     | /
     |/
     (player x, player z)
     
     a = bz - pz
     
     * this is the triangle drawn if you are drawing 
     * in the x direction, ie, 4 or 5


        bx, bz
      c  /|  
      /   | b
    /_______|
         a
  px, pz 

    a = bx - px


     (player x, player z)
     
     */
    
    float a =0;
    float b =0;
    float c =0;
    float d =0;
    float f =0;
    
    float g=5000000;
    
    //for 4, 5,
    //vertical lines = y
    //hori lines = z
    
    //for 2, 3,
    //vertical lines = z
    //hori lines = x
    
    //for 1, 6,
    //vertical lines = y
    //hori lines = x
    float increment=5;
    
    if (nearORfar_angle.equals("Near")) {
      increment=0;
    }
    else if (nearORfar_angle.equals("Far")) {
      increment=1;
    }
    else {
      System.out.println("Error in findDirection_Vertical");
      //crash program
      int crash = 3/0;
    }
    
    if (direction.equals("X Axis")) {
        a = (block_x-player.xpos) ;
        if (a<0) {
          a++;
        }
        a = Math.abs(a) ;
        b = Math.abs(block_z-player.zpos) + increment;
        
        c = ang.findHypotenuse(a, b);
        d = (block_y -player.ypos);
        
        if (d<0) {
          d++;
        }
        d= Math.abs(d);
        
        f=d+1;
        
        //println("x axis calced for vertical");
    }
    else if (direction.equals("Y Axis")) {
        a = Math.abs(block_z-player.zpos)+1;
        b = Math.abs(block_x-player.xpos) + increment;
        
        c = ang.findHypotenuse(a, b);
        d = (block_y -player.ypos) ;
        
        
        if (d<0) {
          d++;
        }
        d= Math.abs(d) ;
        
        f=ang.findHypotenuse(a-1, b);
        g=ang.findHypotenuse(d, f);
        
        //println("y axis calced for vertical");
    }
    else if (direction.equals("Z Axis")) {
      
        a = Math.abs(block_z-player.zpos);
        b = (block_x-player.xpos) ;
        if (b<0) {
          b++;
        }
        b = Math.abs(b) +increment;
        
        c = (float) Math.sqrt( (a*a) + (b*b) );
        
        d = (block_y -player.ypos);
        
        if (d<0) {
          d++;
        }
        d= Math.abs(d);
        
        f=d+1;
        
        //println("z axis calced for vertical");
    }
    
    
    ArrayList<Float> lines = new ArrayList<Float>();
    lines.add(a);
    lines.add(b);
    lines.add(c);
    lines.add(d);
    lines.add(f);
    
    lines.add(g);
    
    
    
    return lines;
  }
  
  
  
  
  
  
  
  
  
  
  
  
