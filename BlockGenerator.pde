public class Generator{
  int[][] iShape = {{1, 1, 1, 1}};
  int[][] oShape = {{1, 1}, {1, 1}};
  int[][] tShape = {{0, 1, 0}, {1, 1, 1}};
  int[][] sShape = {{0, 1, 1}, {1, 1, 0}};
  int[][] zShape = {{1, 1, 0}, {0, 1, 1}};
  int[][] jShape = {{1, 0, 0}, {1, 1, 1}};
  int[][] lShape = {{0, 0, 1}, {1, 1, 1}};
  
  
  Block generateBlock() {
    int type = int(random(7));
    int[][] shape;
    int col;
    
    if(type == 0){
      shape = iShape;
      col = color(0,255,255);
    }else if (type == 1){
      shape = oShape;
      col = color(255,255,0);
    }else if (type == 2){
      shape = tShape;
      col = color(128,0,128);
    }else if (type == 3){
      shape = sShape;
      col = color(0,255,0);
    }else if (type == 4) {
      shape = zShape;
      col = color(255, 0, 0);
    } else if (type == 5) {
      shape = jShape;
      col = color(0, 0, 255);
    } else {
      shape = lShape;
      col = color(255, 165, 0);
    }

    return new Block(shape, col);
  }
}
