 public class Block{
  int[][] shape;
  int currentColor;
  
  
  Block(int[][] shape, int currentColor){
    this.shape = shape;
    this.currentColor = currentColor;
  }
  
 void rotate(TetrisBoard board) {
    int[][] rotatedShape = new int[shape[0].length][shape.length];
    for(int i = 0; i < shape.length; i++) {
       for(int j = 0; j < shape[i].length; j++) {
          rotatedShape[j][shape.length - 1 - i] = shape[i][j];
       }
    }
    if(isWithinBoard(board, rotatedShape)) {
        shape = rotatedShape;
    }
}

private boolean isWithinBoard(TetrisBoard board, int[][] rotatedShape) {
    for(int i = 0; i < rotatedShape.length; i++) {
       for(int j = 0; j < rotatedShape[i].length; j++) {
          if (rotatedShape[i][j] != 0) {
             int x = blockX + j;
             int y = blockY + i;
             if(x < 0 || x >= board.columns || y < 0 || y >= board.rows || board.board[y][x] != 0) {
               return false;
              }
           }
        }
    }
    return true;
}
  
  int[][] getShape() {
    return shape;
  }

  int getColor() {
    return currentColor;
  }
}
