

class Display {
  //will be used to draw quads, rects etc with results from angles classes
  
  public void findDegreesToPixelsRatio() {
    //this will find out how much of the screen an angle should take up
    //if ==5, 2 deg angle will take up 10 pixels
    DEGREES_TO_PIXELS_RATIO = SCREEN_X / SCREEN_DEGREES;
  }
  
  public void drawQuad(float bx, float by, float bz) {
    //fill(#00FF00);
    //quad(152.5, 80.5, 252, 80, 200, 200, 152, 200);
    //quad(593, 124, 649, 124, 672, 206, 624, 206);

    //the following only works for blocks in the upper-right quadrant of the screen
    ArrayList< ArrayList<Float>> angles = ang.calcAngles(bx, by, bz);
    
    //println(DEGREES_TO_PIXELS_RATIO);
    //println("nH: "+angles.get(2).get(2), "fH: "+angles.get(3).get(2));
    
    //println(x_one, y_one, x_two, y_two, x_three, y_three, x_four, y_four);
    
    if (d.checkIfAllAnglesAreValid(angles)) {
      
      ArrayList<String> bpos = player.findQuadrantOfBlock(bx, by);
      float[] coords = findQuadCoords(bx, by, bz, angles, bpos);
      quad(coords[0], coords[1], coords[2], coords[3], coords[4], coords[5], coords[6], coords[7]);
      
    }
  }
  
  public float[] findQuadCoords(float bx, float by, float bz, ArrayList< ArrayList<Float>> angles, ArrayList<String> block_quadrant) {
    //ArrayList<String> bpos = player.findQuadrantOfBlock(bx, by);
    
    float y_one=0;
    float y_four=0;
    float y_two=0;
    float y_three=0;
    
    float x_four=0; 
    float x_three=0;
    float x_one=0; 
    float x_two=0;
    
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
  
  //width, height
  float w = SCREEN_X / DEGREES_TO_PIXELS_RATIO;
  float h = SCREEN_Y / DEGREES_TO_PIXELS_RATIO;
  
  //boolean stored as a float
  //float dontDraw=0;
  
  if ( (block_quadrant.get(0).equals("Left")) ) {
      ArrayList<Float> dupea = angles.get(0);
      ArrayList<Float> dupeb = angles.get(1);
      
      angles.set(0, dupeb);
      angles.set(1, dupea);
  }
  
  if ( (block_quadrant.get(1).equals("Lower")) ) {
      ArrayList<Float> dupea = angles.get(2);
      ArrayList<Float> dupeb = angles.get(3);
      
      angles.set(2, dupeb);
      angles.set(3, dupea);
  }
  
  
 
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
       
       //println(bx, by);
       //println(angles.get(0));
       //println(angles.get(1)+"\n");
       
       
       //println("B");
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
       
       println("D");
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
       
       println("A");
       //println(x_one, y_one, x_two, y_two, x_three, y_three, x_four, y_four);
       
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
       
       println("C");
    }
    
    println(angles.get(0), angles.get(1));
    
    
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
      print(coords[i]+" ");
    }
    println();
    
    return coords;
  }
  
  public boolean checkIfAllAnglesAreValid(ArrayList< ArrayList<Float>> angles) {
    
    for (int i=0; i<angles.size(); i++) {
      for (int j=0; j<angles.get(i).size(); j++) {
        if (Float.isNaN(angles.get(i).get(j))) {
          return false;
        }
      }
    }
    
    return true;
  }
  
  //to help me visualise qrs A B C D
  public void drawQuadrants() {
    rect((width/2)-3, 0, 6, height);
    rect(0, (height/2)-3, width, 6);
    
  }
  
  
  
  
  
  
}
