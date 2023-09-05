//generally unrelated functions need to setup game

void create_Dict_of_Colours() {
    //only meant to be called once
    dict = new HashMap<String, Float>();
    
    //dark -red, -green, -blue, light green, medium yellow
    float[] colours = {0xFF0000, 0x00FF00, 0x0000FF, 0x009900, 0xAAAA00};
    //String[] labels = {"dark red", "dark green", "dark blue", "green", "yellow"};
    String[] labels = {"1", "2", "3", "4", "5"};
    
    
    //dict.put("dark red", 0xFF0000);
    
    for (int i=0; i<labels.length; i++) {
      dict.put(labels[i], colours[i]);
    }

    //return new HashMap<String, Float>();
    
    
  }
  
  
void findDegreesToPixelsRatio() {
    //this will find out how much of the screen an angle should take up
    //if ==5, 2 deg angle will take up 10 pixels
    DEGREES_TO_PIXELS_RATIO = SCREEN_X / SCREEN_DEGREES;
  }
