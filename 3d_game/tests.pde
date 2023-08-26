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
  w.editGrid(9, 10, 0, 10, 14, 24, #00A7FF);
  w.editGrid(3, 4, 0, 10, 14, 24, #00A7FF);
  
  //top-bottom
  w.editGrid(4, 11, 9, 10, 14, 21, #FF0000);
  w.editGrid(4, 11, 1, 2, 14, 21, #FF0000);
  
  //back
  w.editGrid(3, 10, 1, 10, 23, 24, #FF0000);
  
  
}

void XA_HAs_unequal_display() {
  float x=player.xpos;
  float y=player.ypos;
  
  ArrayList<String> bq;// = player.findQuadrantOfBlock(x, y);
  
  bq = player.findQuadrantOfBlock(x+1, y);
  fill(#FFA900);
  d.drawQuad(player.xpos+1, player.ypos, player.zpos+1, "X Axis", bq);
  
  bq = player.findQuadrantOfBlock(x-2, y);
  fill(#69A900);
  d.drawQuad(player.xpos-2, player.ypos, player.zpos+1, "X Axis", bq);
  
  bq = player.findQuadrantOfBlock(x-2, y-1);
  fill(#00DDEE);
  d.drawQuad(player.xpos-2, player.ypos-1, player.zpos+1, "X Axis", bq);
  
  bq = player.findQuadrantOfBlock(x+1, y-1);
  fill(#7F0000);
  d.drawQuad(player.xpos+1, player.ypos-1, player.zpos+1, "X Axis", bq);
  //*/
  
  
  
  
  
  
}
