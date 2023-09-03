
//code to calculate how much of your screen a block takes up as you walk further and further away from it

//it is correct up to 12 decimal points of accuracy, which is at least equivalent to (1/ 10billion) if im correct

import java.lang.Math;
import java.util.ArrayList;

public class Angles {
  
  
  
  //5000 so it doesn't get mixed up with any valid angles initially
  
  //will be used to save half of angle calculations
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
  
  public ArrayList< ArrayList< Float>> calcHorizontalAngles(float bx, float by, float bz, String direction) {
    
    
    ArrayList<Float> nearHA = calcNearHorizontalAngles(bx, by, bz, direction);
    ArrayList<Float> farHA = calcFarHorizontalAngles(bx, by, bz, direction);
    
    ArrayList< ArrayList< Float>> HAs = new ArrayList< ArrayList< Float>>();
    HAs.add(nearHA);
    HAs.add(farHA);
    
    return HAs;
  }
  
  
  
  public ArrayList< ArrayList<Float>> calcAngles(float x, float y, float z, String direction, ArrayList<String> block_quadrant) {
    
    //this will return the angles from a player to a block
    //going from near vertical angle, far vertical angle, near horizontal angle, far horizontal angle, ie,
    
    
    
    /*
     * 
     * 
     *   player
     * 
     *               n-h
     *              _________
     *             |      |
     *           n-v  |      |  f-v
     *             |      |
     *             |_________|
     *               f-v
     * 
     * likewise,
     * 
     *               f-h
     *              _________
     *             |      |
     *           f-v  |      |  n-v
     *             |      |              
     *             |_________|
     *               n-h      player
     * 
     *    
     * 
     */
    
    //float[] farAngleCoords = findFarAngleCoords(player.findQuadrantOfBlock(x, y));
    
    //near angle first, far angle second
    ArrayList< ArrayList<Float>> verticalAngles = calcVerticalAngles(x, y, z, direction); //, farAngleCoords[0]);
    //nearVerticalAngles = verticalAngles.get(1);
    //by changing the value of nearVerticalAngle here, it will not change the value of angles[0] above
    //because that is an new, individual variable, and not a pointer to nearVerticalAngle
    
    ArrayList< ArrayList<Float>> horizontalAngles = calcHorizontalAngles(x, y, z, direction);//, farAngleCoords[1]);
    ArrayList< ArrayList<Float>> angles = new ArrayList< ArrayList<Float>>();
    
    //will this create duplicate objects, or just add the pointers?
    angles.add(verticalAngles.get(0));
    angles.add(verticalAngles.get(1));
    angles.add(horizontalAngles.get(0));
    angles.add(horizontalAngles.get(1));
    
    char[] arr = {'V', 'V', 'H', 'H'};
    for (int i=0; i<angles.size(); i++) {
      
        adjustAngles( angles.get(i), block_quadrant, arr[i], direction );
      
    }
    
    
    //println(angles);
    
    return angles;
  }
    
    
    
    //using law of Cosines to find angle C
    public float findCos(float a, float b, float c) {
      //c is the important length, that is the length that the angle we are
      //finding is facing
      
      //a^2 + b^2 - c^2 / 2ab
      
      double res = (a*a) + (b*b) - (c*c);
      res/= (2*a*b);
      
      //println(" COS: (" +(a*a)+ " + " +(b*b)+ " - "+ (c*c) +") / ( 2 * " +a+ " * " +b+") == " +res);
      
      
      
      if (res>1) {
        //res = 1/res;
        //res=1;
        //res-=0.1;
      }
      
      double resultRadians = Math.acos(res);
      float angle= (float) Math.toDegrees(resultRadians);
      
      return angle;
    }
    
  //using law of Sines
    public float findSin(float length_a, float length_b, float angleB) {
      //angleA is the important angle, that is the length that the angle we are
      //finding is facing
    
      double resultRadians = Math.asin( (length_a / length_b));
      float angle= (float) Math.toDegrees(resultRadians);
      
      
      
      return angle;
    }
    
    public float findHypotenuse( float adjacent, float opposite) {
      double hypo = Math.sqrt(  (adjacent*adjacent) + (opposite*opposite)  );
      return (float) hypo;
    }
    
    
    
    
    public void adjustAngles(ArrayList<Float> angs, ArrayList<String> block_quadrant, char angleType, String dir) {
      //v = vertical, h = horizontal
      
      float deviance = 90 - ((angleType=='H') ? player.horizontal_vision_degrees : player.vertical_vision_degrees);
      int direction = (deviance<0) ? -1 : 1;
      //-1 means moving left, 1 means moving right
      deviance=Math.abs(deviance);
      
      float D = angs.get(0);
      //float E = angs.get(1);
      float F = angs.get(2);
      
      if (angleType=='H') { //horizontal angles
      
      
      //NOT FINISHED, NEED TO ADJUST FOR ALL QUADRANTS
      //ALSO NEED TO FACTOR IN HOW BLOCKS CHANGE QUADRANTS NOW -- pass in nh and fh?
      //if (dir.equals("X Axis")) { 
        /*
        float hvd = player.horizontal_vision_degrees;
        float new_width;// = player.horizontal_vision_degrees / 90;
        
        if (hvd>90) {
          float temp_hvd = 90 - deviance;
          new_width = temp_hvd / 90;
        }
        else {
          new_width = hvd / 90;
        }
      
      
      
        // println("player.horizontal_vision_degrees: ", hvd);
        new_width*= E;
        float difference_of_width = E - new_width;
        
        D+= difference_of_width/2;
        E = new_width;
        F+= difference_of_width/2;
      
        println("D, E, F ", D, E, F);
        
         println( ((D+E+F)!=90 ? "HAs not adding up" : "HAs are adding up")) ;
         
      //}
      
      //*/
      
      
      if ( block_quadrant.get(0).equals("Right") ) {
        //moving in a positive direction
        if (direction==1) {
          D-=deviance;
          F+=deviance;
        }
        else { //moving in a negative direction
          D+=deviance;
          F-=deviance;          
        }
      }
      else { //if block_quadrant.get(0).equals("Left")
        //else, block is on the left side
        if (direction==1) { //neg->pos
          D+=deviance;
          F-=deviance; 
        }
        else {//neg<-pos
          D-=deviance;
          F+=deviance;
        }
        
      }
      
      }//vertical angles
      else if (angleType=='V') {
        
        /*
        float vvd = player.vertical_vision_degrees;
        float new_height;// = player.horizontal_vision_degrees / 90;
        if (vvd>90) {
          float temp_vvd = 90 - deviance;
          new_height = temp_vvd / 90;
        }
        else {
          new_height = vvd / 90;
        }
      
      
      
        // println("player.horizontal_vision_degrees: ", hvd);
        new_height*= E;
        float difference_of_height = E - new_height;
        
        //D+= difference_of_height/2;
        //E = new_height;
        F+= difference_of_height;
      
      //*/
        //println("difference of height: ", difference_of_height);
        //println( ((D+E+F)!=90 ? "VAs not adding up" : "VAs are adding up")) ;
        
        
        
        
        if ( block_quadrant.get(1).equals("Higher") ) {
        //moving in a positive direction
        if (direction==1) {
          D+=deviance;
          F-=deviance;
        }
        else { //moving in a negative direction
          D-=deviance;
          F+=deviance;          
        }
      }
      else { //if block_quadrant.get(1).equals("Lower")
        //else, block is on the bottom side
        if (direction==1) { //neg->pos
          D-=deviance;
          F+=deviance; 
        }
        else {//neg<-pos
          D+=deviance;
          F-=deviance;
        }
        
      }
      }

      angs.set(0, D);
      //angs.set(1, E);
      angs.set(2, F);
      
      
      
      
      //return new ArrayList< ArrayList<Float>>();
    }
    
    
    
    
    //this will determine whether I go from top to bottom to calc the angle below me,
    //or bottom to top for the angle above me
    
    //in order of far vertical, far horizontal
    /*
    public float[] findFarAngleCoords(ArrayList<String> block_quadrant) {
      
      float farVACoord=0;
      float farHACoord=0;
      
      if (block_quadrant.get(0).equals("Right") ) {// && (bpos.get(1).equals("Higher")
        farHACoord=1;
      }
      else {
        farHACoord=-1;
      }
      
      if (block_quadrant.get(1).equals("Higher")) {
        farVACoord=1;
      }
      else {
        farVACoord=-1;
      }
      
      float[] farAngleCoords= {farVACoord, farHACoord};
      return farAngleCoords;
    }
    */
    
    
    
    
    
    public void basic_angle() {
      
      final double angleC=90;
      final double lengthB=1;
      //double length=1;
      
      
      for (int i=0; i<1; i++) {
        
        double lengthA=i+1;
        double lengthC;
        //lengthC = hypotenuse, lengthB = opposite, lengthA= adjacent

        
        double angleA;
        double angleB;
        
        lengthC = Math.sqrt( (lengthA*lengthA) + (lengthB*lengthB) );      
        //h = sqrt( o^2 + a^2)
        
        //find angle B, the angle facing the opposite side
        double resultRadians = Math.asin(lengthB / lengthC);
        angleB = Math.toDegrees(resultRadians);
        
        //find angle A, facing the adjacent side
        resultRadians = Math.asin(lengthA / lengthC);
        angleA = Math.toDegrees(resultRadians);
        
        
        //check if all angles add up to 180 deg
        
//        double res = angleA+angleB+angleC;
        
//        String mes;
//        if ( (res) != 180) {
//          mes= i+": failure ";
////          double t = Math.abs(res-180);
////          if (t>0.00000000000001) {
////            System.out.println(i);
////          }
//          
//        }
//        else {
//          mes= i+": success";
//        }
//        
//        System.out.print(mes);
//        System.out.println(" res=="+res);
        System.out.println( angleB);
        
      }
      

      
    }

}
