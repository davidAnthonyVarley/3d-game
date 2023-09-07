//generally unrelated functions need to setup game

void create_Dict_of_Colours() {
  //only meant to be called once
  dict = new HashMap<>();
  kv_dict = new ArrayList<Key_Value>();

  //dark -red, -green, -blue, light green, medium yellow
  int[] colours = {#FF0000, #009900, #0000FF, #00FF00, #AAAA00};
  //String[] labels = {"dark red", "dark green", "dark blue", "green", "yellow"};
  String[] labels = {"1", "2", "3", "4", "5"};


  //dict.put("dark red", 0xFF0000);

  for (int i=0; i<labels.length; i++) {
    dict.put(labels[i], (float) colours[i]);
    //kv_dict.add(new Key_Value( labels[i], (float) colours[i] ) );
  }

  //return new HashMap<String, Float>();
}


void findDegreesToPixelsRatio() {
  //this will find out how much of the screen an angle should take up
  //if ==5, 2 deg angle will take up 10 pixels
  DEGREES_TO_PIXELS_RATIO = SCREEN_X / SCREEN_DEGREES;
}

//turn spaces in grid to EMPTY instead of staying as null
//should i put this in world class?
void fillRemainderOfGrid() {
  ArrayList< ArrayList< ArrayList<Float>>> grid = w.getGrid();

  int longestvalue = findlongest(grid.get(0).size(), grid.get(0).get(0).size(), grid.size());

  int z_one = 0;
  int z_two = longestvalue;

  int x_one = 0;
  int x_two = longestvalue;

  int y_one = 0;
  int y_two = longestvalue;


  for (int twoD=z_one; twoD<z_two; twoD++) {
    //twoD is the 2d array pointer

    for (int oneD=x_one; oneD<x_two; oneD++) {
      //oneD is the 1d array pointer

      for (int i=y_one; i<y_two; i++) {
        //i is individual index in array

        //println(grid.get(twoD).get(oneD).get(i));
        ///*
        try {
          float current = grid.get(twoD).get(oneD).get(i);
          //if ( current == null) {
          //  grid.get(twoD).get(oneD).set(i, EMPTY);
          //}
        }
        catch (IndexOutOfBoundsException e) {
          try {
            grid.get(twoD).get(oneD).add(EMPTY);
          }
          catch (IndexOutOfBoundsException etwo) {
            grid.get(twoD).add(new ArrayList<Float>());
          }
        }
        //*/
      }
    }


    //println("\n");
  }
}

int findlongest(float x, float y, float z) {
  float longer;
  if (x<y) {
    longer = x;
  } else {
    longer=y;
  }

  float longest = (z>longer) ? z : longer;

  return (int) longest;
}
