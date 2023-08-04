






public ArrayList<Float> calcFarHorizontalAngles(float bx, float by, float bz) {
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
    
    float a = Math.abs(bz - player.zpos);
    float b = Math.abs(by - player.ypos +1);
    float c = (float) Math.sqrt( (a*a) + (b*b) );
    
    float d = Math.abs(bx - player.xpos -1);
    float e = (float) Math.sqrt( (d*d) + (c*c) );
    float angleD = ang.findCos(c, e, d);
    
    float f = d+1;
    float g = (float) Math.sqrt( (e*e) + (f*f) );
    
    float angleE = ang.findCos(g, e, 1);
    
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
    float angleF = 45 - angleD - angleE;
    angleD+=45;
    
    ArrayList<Float> angles = new ArrayList<Float>();
    angles.add(angleD);
    angles.add(angleE);
    angles.add(angleF);
    
    return angles;
  }
  
  
  public static ArrayList<Float> calcNearHorizontalAngles(float bx, float by, float bz) {
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
    
    float a = Math.abs(bz - player.zpos);
    float b = Math.abs(by - player.ypos);
    float c = (float) Math.sqrt( (a*a) + (b*b) );
    
    float d = Math.abs(bx - player.xpos-1);
    float e = (float) Math.sqrt( (d*d) + (c*c) );
    float angleD = ang.findSin(d, e, 90);
    
    float f = d+1;
    float g = (float) Math.sqrt( (e*e) + (f*f) );
    
    float angleE = ang.findCos(g, e, 1);
    
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
    float angleF = 45 - angleD - angleE;
    angleD+=45;
    
    ArrayList<Float> angles = new ArrayList<Float>();
    angles.add(angleD);
    angles.add(angleE);
    angles.add(angleF);
    
    return angles;
  }
