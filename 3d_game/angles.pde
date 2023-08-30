
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
  
  
  
  public ArrayList< ArrayList<Float>> calcAngles(float x, float y, float z, String direction) {
    
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
    
    
    
    
    public ArrayList< ArrayList<Float>> fixRebound(ArrayList<String> block_quadrant) {
      
      if (  (block_quadrant.get(0).equals("Right")) && (block_quadrant.get(1).equals("Higher"))  ) {
        
       //println(bx, by);
       //println(angles.get(0));
       //println(angles.get(1)+"\n");
       
       
       println("B");
    }
    else if ( (block_quadrant.get(0).equals("Right")) && (block_quadrant.get(1).equals("Lower"))) {
 
       println("D");
    }
    else if ( (block_quadrant.get(0).equals("Left")) && (block_quadrant.get(1).equals("Higher"))) {
      
      
      
       
       println("A");
       //println(x_one, y_one, x_two, y_two, x_three, y_three, x_four, y_four);
       
    }
    else if ( (block_quadrant.get(0).equals("Left")) && (block_quadrant.get(1).equals("Lower"))) {
       
       
       println("C");
    }
      
      
      return new ArrayList< ArrayList<Float>>();
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
