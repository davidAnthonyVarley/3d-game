void drawXAStack() {
  
  for (float twoD=player.ypos; twoD<player.ypos+13; twoD++) {
    fill(#0000FF);
    d.drawQuad(13, twoD, 21, "X Axis");
  }
  
}

void drawZAStack() {
  
  for (float twoD=player.ypos; twoD<player.ypos+13; twoD++) {
    fill(#440000);
    d.drawQuad(7, twoD, 21, "Z Axis");
  }
  
}

void drawYAStack() {
  
  for (float twoD=player.ypos; twoD<player.ypos+13; twoD++) {
    fill(#440000);
    d.drawQuad(7, twoD, 21, "Y Axis");
    println(twoD);
  }
  
}

void nHA_YA_test() {
  
  for (float twoD=player.zpos+5; twoD<player.zpos+18; twoD++) {
  float angleD = calcNearHorizontalAngles(7, twoD, 21, "Y Axis").get(0);
  println("angleD: "+angleD);
  }
  
}
