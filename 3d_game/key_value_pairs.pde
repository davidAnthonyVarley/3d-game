
class Key_Value {
  String keyy;
  float value;
  
  public Key_Value( String k, float v) {
    this.keyy = k;
    this.value = v;
    
  }
  
  public Key_Value() {
    
  }
  

  public float getv(ArrayList<Key_Value> pairs, String important_key) {
    
    for (int i = 0; i<pairs.size(); i++) {    
      
      if (important_key.equals(pairs.get(i).keyy)) {
        return pairs.get(i).value;
      }
      
    }
    return 0;
  }
  
  
}
