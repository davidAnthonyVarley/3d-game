
void keyPressed() {
  loop();
  println("Keycode: "+keyCode);
  
  int c = keyCode;
  
  try {
    
  switch (c) {
    
    case 'A':
    case 'a':
      player.xpos++;
      break;
    
    //d
    case 'D':
    case 'd':
      player.xpos--;
      break;
    
    case 'W':
    case 'w':
      player.zpos++;
      break;
    case 'S':
    case 's':
      player.zpos--;
      break;
    
    case ' ':
      player.ypos++;
     break;
    case 'V': //go down
    case 'v':
      player.ypos--;
      break;
    
  }
  
  }
  catch (IndexOutOfBoundsException e) {
    //do nothing, ie, don't move the player out of bounds
  }
  
  println("x:"+player.xpos+" y:"+player.ypos+" z:"+player.zpos+"\n\n");
}
