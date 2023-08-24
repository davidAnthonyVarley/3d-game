






public ArrayList<Float> calcFarHorizontalAngles(float bx, float by, float bz, String direction) {
    //remember to change e2 and g2 to e1 and g1 after angles calculated
    //Angles ang = new Angles();
    
    
    /*
    double cosE = ( (e_one*e_one)+(e_two*e_two) - 1  ) / (2*e_one*e_two);
    double resultRadians = Math.acos(cosE);
    float nearHorizontalAngles= (float) Math.toDegrees(resultRadians);
    
    double cosG = ( (g_one*g_one)+(g_two*g_two) - 1  ) / (2*g_one*g_two);
    resultRadians = Math.acos(cosG);
    float farHorizontalAngle= (float) Math.toDegrees(resultRadians);
    
    e_one = e_two;
    g_one = g_two;
    */
    
    ArrayList<Float> lines = findTriangle_HorizontalAngles(bx,  by,  bz, direction, "Far");
    
    float a = lines.get(0);//(float) Math.sqrt( (a*a) + (b*b) );
    float b = lines.get(1);//Math.abs(bx - player.xpos);
    float c = lines.get(2);//(float) Math.sqrt( (a*a) + (b*b) );
    float d = lines.get(3);//Math.abs(bx - player.xpos);

    
    float e = ang.findHypotenuse(c, d);
    //println("E fH:", e);
    float angleD = ang.findCos(c, e, d);
    
    float f = lines.get(4);
    float g = lines.get(5);
    
    if (g==5000000) {
     g = ang.findHypotenuse(e, f);
    }
    
    //println(a, b, c, d, e, f, g);
    
    
    /*
    
    |  /    /        /
    |      /        /
    |  /  /      /
    |    /      /
    |D/E/ F    /
   45deg|45deg    /
    
    D will equal angleD + 45deg, because the width of the screen is 90deg
    E is the angle to the block
    F is the rest of the 45 deg
    
    
    */
    float angleE;// = ang.findCos(e, g, 1);
    
    if (direction.equals("X Axis")) {
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
    angleD+=HALF_SCREEN_DEGREES;
    
    ArrayList<Float> fh_angles = new ArrayList<Float>();
    fh_angles.add(angleD);
    fh_angles.add(angleE);
    fh_angles.add(angleF);
    
    //println(fh_angles);
    
    return fh_angles;
  }
  
  
  public static ArrayList<Float> calcNearHorizontalAngles(float bx, float by, float bz, String direction) {
    //remember to change e2 and g2 to e1 and g1 after angles calculated
    
   
    
    /*
    double cosE = ( (e_one*e_one)+(e_two*e_two) - 1  ) / (2*e_one*e_two);
    double resultRadians = Math.acos(cosE);
    float nearHorizontalAngles= (float) Math.toDegrees(resultRadians);
    
    double cosG = ( (g_one*g_one)+(g_two*g_two) - 1  ) / (2*g_one*g_two);
    resultRadians = Math.acos(cosG);
    float farHorizontalAngle= (float) Math.toDegrees(resultRadians);
    
    e_one = e_two;
    g_one = g_two;
    */
    
    ArrayList<Float> lines = findTriangle_HorizontalAngles(bx,  by,  bz, direction, "Near");
 
    //float a = Math.abs(bz - player.zpos);
    //float b = Math.abs(by - player.ypos +1);
    float a = lines.get(0);//(float) Math.sqrt( (a*a) + (b*b) );
    float b = lines.get(1);//Math.abs(bx - player.xpos);
    
    float c = lines.get(2);//(float) Math.sqrt( (a*a) + (b*b) );
    float d = lines.get(3);//Math.abs(bx - player.xpos);
    
    
    
    float e = ang.findHypotenuse(c, d);
    //println("E nH:", e);
    float angleD = ang.findSin(d, e, 90);
    
    float f = lines.get(4);
    float g = lines.get(5);
    
    if (g==5000000) {
     g = ang.findHypotenuse(e, f);
    }
    //println("g nH:", g);
    //println(a, b, c, d, e, f, g);
    
    /*
    
     |  /    /        /
     |      /        /
     |  /  /      /
     |    /      /
     |D/E/ F    /
45deg|45deg    /
    
    D will equal angleD + 45deg, because the width of the screen is 90deg
    E is the angle to the block
    F is the rest of the 45 deg
    
    
    */
    float angleE;// = ang.findCos(e, g, 1);
    
    if (direction.equals("X Axis")) {
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
    angleD+=HALF_SCREEN_DEGREES;
    
    ArrayList<Float> nh_angles = new ArrayList<Float>();
    nh_angles.add(angleD);
    nh_angles.add(angleE);
    nh_angles.add(angleF);
    
    return nh_angles;
  }
  
  
  public static ArrayList<Float> findTriangle_HorizontalAngles(float block_x, float block_y, float block_z, String direction, String nearORfar_angle) {
    //documentation is in findTriangle_VerticalAngles function
    
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
      System.out.print("Error in findDirection_hori");
      //crash program
      int crash = 3/0;
    }
    
    if (direction.equals("X Axis")) {
      
        a = Math.abs(block_z-player.zpos)+1;
        b = Math.abs(block_y-player.ypos) + increment;
        
        c = ang.findHypotenuse(a, b);
        d = (block_x -player.xpos) ;
        
        
        if (d<0) {
          d++;
        }
        d= Math.abs(d) ;
        
        f=ang.findHypotenuse(a-1, b);
        g=ang.findHypotenuse(d, f);
        println("x axis calced for hori");
        
    }
    else if (direction.equals("Y Axis")) {
      
        a = Math.abs(block_y-player.ypos);
        b = Math.abs(block_z-player.zpos) + increment;
        
        c = ang.findHypotenuse(a, b);
        d = (block_x -player.xpos);
        
        if (d<0) {
          d++;
        }
        d= Math.abs(d);
        
        f=d+1;
        
         println("y axis calced for hori");
    }
    else if (direction.equals("Z Axis")) {
        a = Math.abs(block_z-player.zpos);
        b = Math.abs(block_y-player.ypos) + increment ;
        
        c = ang.findHypotenuse(a, b);
        d = (block_x -player.xpos);
        
        if (d<0) {
          d++;
        }
        d= Math.abs(d);
        
        f=d+1;
         println("z axis calced for hori");
        
    }
    
    
    
    
    ArrayList<Float> lines = new ArrayList<Float>();
    lines.add(a);
    lines.add(b);
    lines.add(c);
    lines.add(d);
    lines.add(f);
    
    //we only need to determine g here if it is X Axis HA, or Y Axis VA
    lines.add(g);
    
    
    
    return lines;
    
  }
  
  
