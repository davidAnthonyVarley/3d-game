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
  w.editGrid(3, 10, 1, 10, 23, 24, #FF0000);
  
  
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
  //BufferedWriter bw;
  //try {
     //bw = //new BufferedWriter( new FileWriter("wwworld.txt")); //saved_worlds\\basic_world
  //}
  //catch (FileNotFoundException e) {
    
 // }
    //bw.write("1hey");
    //bw.write(" 2there");
    String data="";
    
    for (int i=0; i<10; i++) {
      //bw.write("1-2-3--2-1-2--3-2-1");
      data+="1-2-3--2-1-2--3-2-1";
      if (i!=9) {
        //bw.write("---");
        data+="---";
      }
    }
    String d[] = {data};
    
    saveStrings("wwworld.txt", d);
    
    System.out.println("writen");
    
    //bw.close();
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
