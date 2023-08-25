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
