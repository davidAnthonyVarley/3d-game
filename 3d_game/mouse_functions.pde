
void mousePressed() {
  loop();
}

void mouseReleased() {
  noLoop();
}

void mouseMoved() {
  
  player.adjustVisionDegrees();
  
}
