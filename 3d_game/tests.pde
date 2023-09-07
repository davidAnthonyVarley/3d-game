void drawXAStack() {
  
  for (float twoD=player.ypos; twoD<player.ypos+13; twoD++) {
    fill(#0000FF);
    //d.drawQuad(13, twoD, 21, "X Axis");
  }
  
}

void drawZAStack() {
  
  for (float twoD=player.ypos; twoD<player.ypos+13; twoD++) {
    fill(#440000);
    //d.drawQuad(7, twoD, 21, "Z Axis");
  }
  
}

void drawYAStack() {
  
  for (float twoD=player.ypos; twoD<player.ypos+13; twoD++) {
    fill(#440000);
    //d.drawQuad(7, twoD, 21, "Y Axis");
    println(twoD);
  }
  
}

void nHA_YA_test() {
  
  for (float twoD=player.zpos+5; twoD<player.zpos+18; twoD++) {
  float angleD = calcNearHorizontalAngles(7, twoD, 21, "Y Axis").get(0);
  println("angleD: "+angleD);
  }
  
}

void createCorridor() {
  
  //left-right sides
  w.editGrid(10, 11, 0, 10, 14, 24, #00A7FF);
  w.editGrid(3, 4, 0, 10, 14, 24, #00A7FF);
  
  //top-bottom
  w.editGrid(4, 11, 9, 10, 14, 24, #FF0000);
  w.editGrid(4, 11, 1, 2, 14, 24, #FF0000);
  
  //back
  w.editGrid(3, 10, 1, 10, 23, 24, dict.get("4"));
  
  
}

void XA_HAs_unequal_display() {
  float x=player.xpos;
  float y=player.ypos;
  
  ArrayList<String> bq;// = player.findQuadrantOfBlock(x, y);
  
  bq = player.findQuadrantOfBlock(x, y+1);
  fill(#FFA900);
  d.drawQuad(x, y+1, player.zpos+1, "Y Axis", bq);
  
  bq = player.findQuadrantOfBlock(x-1, y-1);
  fill(#69A900);
  d.drawQuad(x-1, y-2, player.zpos+1, "Y Axis", bq);
  
  bq = player.findQuadrantOfBlock(x-1, y);
  fill(#00DDEE);
  d.drawQuad(x-1, y+1, player.zpos+1, "Y Axis", bq);
  
  bq = player.findQuadrantOfBlock(x, y-1);
  fill(#7F0000);
  d.drawQuad(x, y-2, player.zpos+1, "Y Axis", bq);
  //*/
  
  
}

void YA_HAs_test() {
  
  float x=player.xpos;
  float y=player.ypos;
  
  ArrayList<String> bq;// = player.findQuadrantOfBlock(x, y);
  //y-2
  bq = player.findQuadrantOfBlock(x-1, y+1);
  fill(#00A900);
  d.drawQuad(x-1, y+1, player.zpos+5, "Y Axis", bq);
  
  bq = player.findQuadrantOfBlock(x-1 , y+1);
  fill(#666000);
  d.drawQuad(x-2, y+1, player.zpos+5, "Y Axis", bq);
  
  //println("\n\n");
  //System.out.println(calcFarVerticalAngles(x, y+1, player.zpos+5, "Y Axis"));
  //System.out.println(calcNearVerticalAngles(x+1, y+1, player.zpos+5, "Y Axis"));
  
  
  bq = player.findQuadrantOfBlock(x, y+1);
  fill(#666000);
  d.drawQuad(x+2, y+1, player.zpos+5, "Y Axis", bq);
  
  
  bq = player.findQuadrantOfBlock(x, y+1);
  fill(#FFA900);
  d.drawQuad(x, y+1, player.zpos+3, "Y Axis", bq);
  
  bq = player.findQuadrantOfBlock(x+1, y+1);
  fill(#00A9FF);
  d.drawQuad(x+1, y+1, player.zpos+3, "Y Axis", bq);
  
  //-----------
  
  
  bq = player.findQuadrantOfBlock(x-1, y-2);
  fill(#00A900);
  d.drawQuad(x-1, y-2, player.zpos+3, "Y Axis", bq);
  
  bq = player.findQuadrantOfBlock(x-2, y-2);
  fill(#666000);
  d.drawQuad(x-2, y-2, player.zpos+3, "Y Axis", bq);
  
  bq = player.findQuadrantOfBlock(x, y-2);
  fill(#FFA900);
  d.drawQuad(x, y-2, player.zpos+3, "Y Axis", bq);
  
  bq = player.findQuadrantOfBlock(x+1, y-2);
  fill(#00A9FF);
  d.drawQuad(x+1, y-2, player.zpos+3, "Y Axis", bq);
  //*/
  
  
  
  
}

void testwrite() throws IOException {
  
  
  int z_one=0;
  int z_two=15;
  
  int x_one=0;
  int x_two=15;
  
  int y_one=0;
  int y_two=1;
  
  
  
  
  
    String data="15-5-15,";
    
    for (int twoD=z_one; twoD<z_two; twoD++) {
      //twoD is the 2d array pointer
      
      for (int oneD=x_one; oneD<x_two; oneD++) {
        //oneD is the 1d array pointer
        
        for (int i=y_one; i<y_two; i++) {
          //i is individual index in array
          
          data+="4-";
        }
        if (oneD!=(x_two-1)) {
          data+="-";
        }
      }
      if (twoD!=(z_two-1)) {
          data+="--";
        }
      
      println("\n");
    }
    
    
    
    
    String d[] = {data};
    
    saveStrings("flat.txt", d);
    
    System.out.println("writen");
    
    //bw.close();
  }
  
  
  void createFloor() {
    w.editGrid(0, 11, 0, 1, 0, 11, dict.get("4"));
  }



void HAs_of_cube_line_test() {
  int t=0;
  
   for (float twoD=player.xpos; twoD<player.xpos+8; twoD++, t++) {
     
     println("H BLOCK "+t+": ", twoD, 5, 15);
     d.drawCube(twoD, 5, 15);
     
     //println("V BLOCK "+t+": ", 5, twoD, 15);
     //d.drawCube(5, twoD, 15);
   }
   
   /*
   t=0;
   for (float twoD=player.ypos; twoD<player.ypos+7; twoD++, t++) {
     println("H BLOCK "+t);
     d.drawCube(5, twoD, 15);
   }
  //*/
}
