public class Board{
 int rows;
 int columns;
 int cellSize;
 int[][] board;
 int centerX;
 int centerY;
 
 Board(int rows, int columns, int cellSize, int centerX, int centerY){
  this.rows = rows;
  this.columns = columns;
  this.cellSize = cellSize;
  this.centerX = centerX;
  this.centerY = centerY;
  board = new int[rows][columns];
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        board[i][j] = 0;
      }
    }
  }
  
 
 void display() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < columns; j++) {
        if (board[i][j] != 0) {
          fill(255);
        }else {
          fill(0);
        }
        stroke(100);
        rect(centerX + j * cellSize, centerY + i * cellSize, cellSize, cellSize);
      }
    }
  }
  
  
}