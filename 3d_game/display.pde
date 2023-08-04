

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
    
    println(DEGREES_TO_PIXELS_RATIO);
    
    float y_one =   (angles.get(0).get(2) * DEGREES_TO_PIXELS_RATIO);             //nV
    float y_four =  SCREEN_Y - (angles.get(0).get(0) * DEGREES_TO_PIXELS_RATIO); //nV
    float y_two =   (angles.get(1).get(2) * DEGREES_TO_PIXELS_RATIO);            //fV
    float y_three = SCREEN_Y - (angles.get(1).get(0) * DEGREES_TO_PIXELS_RATIO);//fV
    
    float x_four =  (angles.get(2).get(0) * DEGREES_TO_PIXELS_RATIO);            //nH
    float x_three = SCREEN_X - (angles.get(2).get(2) * DEGREES_TO_PIXELS_RATIO); //nH
    float x_one =   (angles.get(3).get(0) * DEGREES_TO_PIXELS_RATIO);            //fH
    float x_two =   SCREEN_X - (angles.get(3).get(2) * DEGREES_TO_PIXELS_RATIO); //fH
    println(x_one, y_one, x_two, y_two, x_three, y_three, x_four, y_four);
    
    fill(#00008F);
    quad(x_one, y_one, x_two, y_two, x_three, y_three, x_four, y_four);
    
  }
  
  
  
  
  
  
}
