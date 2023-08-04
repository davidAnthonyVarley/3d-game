
void keyPressed() {
  println("Keycode: "+keyCode);
  
  int c = keyCode;
  
  try {
    
  switch (c) {
    
    case 'A':
      player.xpos--;
      break;
    
    //d
    case 'D':
      player.xpos++;
      break;
    
    case 'W':
      player.zpos++;
      break;
    case 'S':
      player.zpos--;
      break;
    
    case ' ':
      player.ypos++;
     break;
    case 'U': //go down
      player.ypos--;
      break;
    
  }
  
  }
  catch (IndexOutOfBoundsException e) {
    
  }
  
  println("x:"+player.xpos+" y:"+player.ypos+" z:"+player.zpos+"\n\n");
}
