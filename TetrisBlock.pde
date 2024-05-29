 public class Block{
  int[][] shape;
  int currentColor;
  
  
  Block(int[][] shape, int currentColor){
    this.shape = shape;
    this.currentColor = currentColor;
  }
  
  void rotate() {
    int n = shape.length;
    int m = shape[0].length;
    int[][] rotatedShape = new int[m][n];
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        rotatedShape[j][n - 1 - i] = shape[i][j];
      }
    }
    shape = rotatedShape;
  }
  
  
  int[][] getShape() {
    return shape;
  }

  int getColor() {
    return currentColor;
  }
}
