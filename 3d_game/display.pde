

class Display {
  //will be used to draw quads, rects etc with results from angles classes
  
  public void findDegreesToPixelsRatio() {
    //this will find out how much of the screen an angle should take up
    //if ==5, 2 deg angle will take up 10 pixels
    DEGREES_TO_PIXELS_RATIO = SCREEN_X / SCREEN_DEGREES;
  }
  
  public void drawCube(float bx, float by, float bz) {
    
    //we only see three sides of a cube in any given position
    //therefore, we only need to draw three sides, each one facing one axis
    
    //ie, if the block is in the upper-right quadrant,
    //draw sides 4, 2, 1
    ArrayList<String> block_quadrant = player.findQuadrantOfBlock(bx, by);
    
    fill(#0044FF);
    drawQuad(bx, by, bz, "Y Axis", block_quadrant);
    //println("\n");
    
    fill(#00A900);
    drawQuad(bx, by, bz, "X Axis", block_quadrant);
    //println("\n");
    
    
    fill(#FFA900);
    drawQuad(bx, by, bz, "Z Axis", block_quadrant);
    println("\n");
    
    
  }
  
  public void drawQuad(float bx, float by, float bz, String direction, ArrayList<String> block_quadrant) {

    //if the side of the block isn't covered by another block
    boolean covered = player.isQuadCovered( bx, by, bz, direction, block_quadrant);
    ArrayList< ArrayList<Float>> angles;// = new ArrayList< ArrayList<Float>>();
    
    
    if (!covered) {
      angles = ang.calcAngles(bx, by, bz, direction, block_quadrant);
      //ang.adjustAngles(angles, block_quadrant);
      //if (d.blockIsOnScreen(angles, block_quadrant) ) {
        
        float[] coords = findQuadCoords(angles, block_quadrant, direction);
        quad(coords[0], coords[1], coords[2], coords[3], coords[4], coords[5], coords[6], coords[7]);
      
      //}
    }
    //println(DEGREES_TO_PIXELS_RATIO);
    
  }
  
  public float[] findQuadCoords(ArrayList< ArrayList<Float>> angles, ArrayList<String> block_quadrant, String direction) {
    
    float y_one=0;
    float y_four=0;
    float y_two=0;
    float y_three=0;
    
    float x_four=0; 
    float x_three=0;
    float x_one=0; 
    float x_two=0;
    
    //documentation below
    
 /*   
    x1, y1__________x2, y2
         |          |
         |          |    
    x4, y4__________x3, y3
    
 */
 
 /*
     float nV_angleD;
     float nV_angleF;
     float fV_angleD;
     float fV_angleF;
     
     float nH_angleD;
     float nH_angleF;
     float fH_angleD;
     float fH_angleF;
  */
  
  //float[] coords = {0, 0, 0, 0, 0, 0, 0, 0};
  
  //proper solution will get coords in order of 
  
  //nearVericalAngle closest vertice
  //nVA furthest vertice
  //fVA closest vertice
  //fVA furthest vertice
  
  //and so on
  
  
  //boolean stored as a float
  //float dontDraw=0;
  
  
  //width, height
  float w = SCREEN_X / DEGREES_TO_PIXELS_RATIO;
  float h = SCREEN_Y / DEGREES_TO_PIXELS_RATIO;
  
  if (direction.equals("Y Axis")) {
    ///*
    ArrayList<Float> dupea = angles.get(0);
      ArrayList<Float> dupeb = angles.get(1);
      
      //angles.set(0, dupeb);
      //angles.set(1, dupea);
      
      ArrayList<Float> dupec = angles.get(2);
      ArrayList<Float> duped = angles.get(3);
      
      angles.set(2, duped);
      angles.set(3, dupec);
  //*/
      
  }
  
  if (direction.equals("X Axis")) {
    
    ///*
     ArrayList<Float> dupea = angles.get(0);
      ArrayList<Float> dupeb = angles.get(1);
      
      angles.set(0, dupeb);
      angles.set(1, dupea);
      //*/

  }
  
  //angles = ang.fixRebound(block_quadrant);
 
    if (  (block_quadrant.get(0).equals("Right")) && (block_quadrant.get(1).equals("Higher"))  ) {
      
      
      
      
      //angle D
       y_four =  h - (angles.get(0).get(0) ); //nV
      //angle F
       y_one =   (angles.get(0).get(2) );             //nV
       //angle D
       y_three = h - (angles.get(1).get(0) );//fV
       //angle F
       y_two =   (angles.get(1).get(2) );            //fV
    
      //angle D
       x_four =  (angles.get(2).get(0) );            //nH
       //angle F
       x_three = w - (angles.get(2).get(2) ); //nH
       //angle D
       x_one =   (angles.get(3).get(0) );            //fH
       //angle F
       x_two =   w - (angles.get(3).get(2) ); //fH
       
       
       
       print("B");
    }
    else if ( (block_quadrant.get(0).equals("Right")) && (block_quadrant.get(1).equals("Lower"))) {
       y_one =   (angles.get(0).get(0) );             //nV
       y_four =  h - (angles.get(0).get(2) ); //nV
       y_two =   (angles.get(1).get(0) );            //fV
       y_three = h - (angles.get(1).get(2) );//fV
    
       x_one =   (angles.get(2).get(0) );            //fH
       x_two =   w - (angles.get(2).get(2) ); //fH
       x_four =  (angles.get(3).get(0) );            //nH
       x_three = w - (angles.get(3).get(2) ); //nH
       
       print("D");
    }
    else if ( (block_quadrant.get(0).equals("Left")) && (block_quadrant.get(1).equals("Higher"))) {
      
      
      
       y_three = h - (angles.get(0).get(0) );//angle D
       y_two =   (angles.get(0).get(2) ); //angle F
       y_four =  h - (angles.get(1).get(0) );
       y_one =   (angles.get(1).get(2) );             //nV
    
       x_three = w - (angles.get(2).get(0) ); //angle D
       x_four =  (angles.get(2).get(2) );            //angle F
       x_two =   w - (angles.get(3).get(0) ); //angle D
       x_one =   (angles.get(3).get(2) );            //angle F
       
       print("A");
       
    }
    else if ( (block_quadrant.get(0).equals("Left")) && (block_quadrant.get(1).equals("Lower"))) {
       y_two =   (angles.get(0).get(0) );
       y_three = h - (angles.get(0).get(2) );//fV
       y_one =   (angles.get(1).get(0) );             //nV
       y_four =  h - (angles.get(1).get(2) ); //nV
    
       x_two =   w - (angles.get(2).get(0) ); //fH
       x_one =   (angles.get(2).get(2) );            //fH
       x_three = w - (angles.get(3).get(0) ); //nH
       x_four =  (angles.get(3).get(2) );            //nH
       
       print("C");
    }
    print(": "+direction+"\n");
  //}
    
    println("Near Vertical: "+angles.get(0), "Far Vertical: "+ angles.get(1));
    println("Near Horizontal: "+angles.get(2), "Far Horizontal: "+ angles.get(3)+"\n");
    
    /*
    if (direction.equals("X Axis")) {
      //println(angles.get(2), angles.get(3));
    }
    else if (direction.equals("Y Axis")) {
      //println(angles.get(0), angles.get(1));
    }
    //*/
    
    
    float[] coords = { x_one, y_one, x_two, y_two, x_three, y_three, x_four, y_four };
    //println( x_one, y_one, x_two, y_two, x_three, y_three, x_four, y_four);
    
    /*
    for (int iter=0; iter<coords.length; iter++) {
      if (Float.isNaN(coords[iter])) {
        println("FH Angles D, E, F: "+angles.get(3) );
        println("block coords: "+ bx, by, bz );
        println("player coords: " + player.xpos, player.ypos, player.zpos );
        noLoop();
      }
    }
    */
    
    //DEGREES_TO_PIXELS_RATIO=1;
    for (int i=0; i<coords.length; i++) {
      coords[i]*=DEGREES_TO_PIXELS_RATIO;
      //print(coords[i]+" ");
    }
    
    //doubleSize(coords);
    
    return coords;
  }
  
  
  
  
  
  //if angle D ==90 deg, the width of the screen, don't bother drawing
  boolean blockIsOnScreen(ArrayList< ArrayList<Float>> angles, ArrayList<String> block_quadrant) {
    for (int i=0; i<angles.size(); i++) {
      if (angles.get(i).get(0)>=90) {
        angles.get(i).set(2, angles.get(i).get(2)*-1);
        //return false;
      }
    }
    return true;
    
    
  }
  
  
  
  public boolean checkIfAllAnglesAreValid(ArrayList< ArrayList<Float>> angles) {
    
    for (int i=0; i<angles.size(); i++) {
      for (int j=0; j<angles.get(i).size(); j++) {
        if (Float.isNaN(angles.get(i).get(j))) {
          
          //if angle E==NaN, angF=0;
          //angles.get(i).set(2, (float)0);
          
          return false;
        }
      }
    }
    
    return true;
  }
  
  //no need to return float[] as passing in reference
  public void roundCoords(float[] coords) {
    for (int i=0; i<coords.length; i++) {
      coords[i] = Math.round(coords[i]);
    }
  }
  
  
  
  public void doubleSize(float[] coords) { //ArrayList<String> block_quadrant
    
    /*   
    x1, y1__________x2, y2
         |          |
         |          |    
    x4, y4__________x3, y3
    
   */
 
   //x_one, y_one, x_two, y_two, x_three, y_three, x_four, y_four
 
   //find half the distance between each set of vertices
 
    //x2 - x1
    float top_difference = (coords[2]-coords[0]) / 2;
    //x3-x4
    float bottom_difference = (coords[6]-coords[4]) / 2;
    //y1-y4
    float left_difference = (coords[1]-coords[7]) / 2;
    //y2-y3
    float right_difference = (coords[3]-coords[5]) / 2;
    
    coords[0]-= top_difference;
    coords[2]+= top_difference;
    
    coords[4]-=bottom_difference;
    coords[6]+=bottom_difference;
    
    coords[7]-=left_difference;
    coords[1]+=left_difference;
    
    coords[5]-=right_difference;
    coords[3]+=right_difference;
    
    
  }
  
  
  //to help me visualise qrs A B C D
  public void drawQuadrants() {
    fill(#ffffff);
    rect((width/2)-3, 0, 6, height);
    rect(0, (height/2)-3, width, 6);
    
  }
  
  
  
  
  
  
}
