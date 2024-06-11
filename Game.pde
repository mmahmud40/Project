boolean starterPage = true;
boolean selectionPage = false; 
boolean singlePlayerPage = false;
boolean lossScreenPage = false;

int X;
int Y;
int blockX;
int blockY;

TetrisBoard board1;
TetrisBoard board2;
TetrisBoard board3;
Block currentBlock;
Block nextBlock;
Generator gen;

int dropInterval = 1000; //for milliseconds
int lastDropTime;

int score = 0;
int highScore = 0;

boolean gameOver = false;

boolean beginner = false;
boolean intermediate = false;
boolean expert = false;

void setup(){
  size(1000,800);
  X = width/2;
  Y = height/2;
  int centerX = (width-10 * 30)/2;
  int centerY = (height-20 * 30)/2;
  board1 = new TetrisBoard(20,10,30,centerX,centerY);
  board2 = new TetrisBoard(20, 10, 30, 200, centerY);
  board3 = new TetrisBoard(20, 10, 30, 500 + 50, centerY); 
  gen = new Generator();
  currentBlock = gen.generateBlock();
  nextBlock = gen.generateBlock();
  blockX = 3;
  blockY = 0;
  
  lastDropTime = millis();

}

void draw(){
  setDifficulty();
  
  if(starterPage == true){
    displayStarterPage();
  }
  if(selectionPage == true){
    displaySelectionPage();
  }
  if(singlePlayerPage == true){
     displaySinglePlayerPage();    
     if(gameOver == true){
       displayLossScreen();
     }
  }
      
  }


void setDifficulty() {
  if (beginner) {
    dropInterval = 800; 
  } else if (intermediate) {
    dropInterval = 300; 
  } else if (expert) {
    dropInterval = 100;
  }
}



boolean isMouseOver(int x, int y, int w, int h){
  if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h){
    return true;
  }
  return false;
}

void mouseClicked(){
  //switch from starter to selection
  if(isMouseOver(X-65,Y+60,140,50) == true && starterPage == true){
    starterPage = false;
    selectionPage = true;
  }
  
  //switch from selection to starter
  if(isMouseOver(X+350,20,125,75) == true && selectionPage == true){
    starterPage = true;
    selectionPage = false;
  }
  
  //switch from selection to singleplayer(easy)
  
  if(isMouseOver(X-300,Y-200,600,75) == true && selectionPage == true){
    selectionPage = false;
    starterPage = false;
    singlePlayerPage = true;
    beginner = true;
  }
  
  //switch from selection to singleplayer(med)
  
  if(isMouseOver(X-300,Y,600,75) == true && selectionPage == true){
    selectionPage = false;
    starterPage = false;
    singlePlayerPage = true;
    intermediate = true;
  }
  
  //switch from selection to singleplayer(hard)
  
  if(isMouseOver(X-300,Y+200,600,75) == true && selectionPage == true){
    selectionPage = false;
    starterPage = false;
    singlePlayerPage = true;
    expert = true;
  } 
  
  
  //go from loser screen to selection screen
  if(isMouseOver(350,425,300,50) == true && gameOver == true && singlePlayerPage == true){
    gameOver = false;
    singlePlayerPage = false;
    starterPage = true;
    int centerX = (width-10 * 30)/2;
    int centerY = (height-20 * 30)/2;
    board1 = new TetrisBoard(20,10,30,centerX,centerY);
    if (score > highScore){
      highScore = score;
    }
    score = 0;
        }  
  }
  


void displayStarterPage(){
  stroke(0);
  background(0,0,100);
  fill(0,0,200);
    rect(X-250,Y-250,500,10); // Top border
    rect(X-250,Y-250,10,170); // Left border
    rect(X-250,Y-80,185,10);  // Middle top left border
    rect(X-75,Y-80,10,120);   // Middle left border
    rect(X+75,Y-80,10,120);   // Middle right border
    rect(X-75,Y+30,160,10);  // Middle bottom border
    rect(X+85,Y-80,175,10);   // Middle top right border
    rect(X+250,Y-250,10,170); // Right border
    
    //tetris logo
    
    //T
    fill(255,0,0);
    rect(X-230,Y-180, 70, 15);
    rect(X-202,Y-180, 15, 70);
    
    //E
    fill(255,165,0);
    rect(X-150, Y-180, 15, 70);
    rect(X-135, Y-180, 40,15);
    rect(X-135, Y-152, 25,15);
    rect(X-135, Y-125, 25,15);
    triangle(X-110,Y-152, X-110,Y-137, X-95, Y-152);

    // T
    fill(255,255,0);
    rect(X-80, Y-180, 70, 15);
    rect(X-52, Y-180, 15, 70);
    
    // R
    fill(0,255,0);
    rect(X, Y-180, 15, 70);
    rect(X+15, Y-180, 30, 15);
    rect(X+15, Y-152, 30, 15);
    rect(X+45, Y-165, 15, 15);
    rect(X+35, Y-137, 15, 15);
    rect(X+45, Y-122, 15, 15);
    
    // I
    fill(0,255,255);
    rect(X+80, Y-180, 15, 70);
    
    // S
    fill(0,0,255);
    rect(X+110, Y-180, 40, 15);
    rect(X+110,Y-180, 15, 30);
    rect(X+110,Y-150, 40,15);
    rect(X+135,Y-150, 15, 30);
    rect(X+110,Y-120, 40,15);
    
    //+
    
    fill(255,255,0);
    rect(X+170,Y-150,40,10);
    rect(X+185,Y-165,10,40);
    
        //BUTTONS
    
    //PLay button
    fill(0,177,0);
    if(isMouseOver(X-65,Y+60,140,50) == true){
      fill(82,100,74);
    }
    rect(X-65,Y+60,140,50);
    fill(255);
    textSize(40);
    text("PLAY", X-37,Y+95);
    
}

void displaySelectionPage(){
 stroke(0);
 background(0,0,100);
    //beginner button
    fill(0,177,0);
    if(isMouseOver(X-300,Y-200,600,75) == true){
      fill(82,100,74);
    }
    rect(X-300,Y-200,600,75);
    fill(255);
    textSize(65);
    text("Beginner", X-130, Y-140);
    
    //intermediate button
    fill(0,177,0);
    if(isMouseOver(X-300,Y,600,75) == true){
      fill(82,100,74);
    }
    rect(X-300,Y,600,75);
    fill(255);
    textSize(65);
    text("Intermediate", X-170, Y+60);
    
    
    //expert button
    fill(0,177,0);
    if(isMouseOver(X-300,Y+200,600,75) == true){
      fill(82,100,74);
    }
    rect(X-300,Y+200,600,75);
    fill(255);
    textSize(65);
    text("Expert", X-95, Y+260);
    
    
    
    
    //back button
    
    fill(0,177,0);
    if(isMouseOver(X+350,20,125,75) == true){
      fill(82,100,74);
    }
    rect(X+350,20,125,75);
    fill(255);
    textSize(55);
    text("Back", X+355, 80); 
}


void drawBlock(){
  int[][] shape = currentBlock.getShape();
  int col = currentBlock.getColor();
  fill(col);
  for (int i = 0; i < shape.length; i++) {
    for (int j = 0; j < shape[i].length; j++) {
      if (shape[i][j] != 0) {
        rect(board1.centerX + (blockX + j) * board1.cellSize, board1.centerY + (blockY + i) * board1.cellSize, board1.cellSize, board1.cellSize);
      }
    }
  }
}

void keyPressed(){
   if (key == 'a' || key == 'A') {
    if(canMoveLeft()){
      blockX -= 1;
    }
  } else if (key == 'd' || key == 'D') {
    if(canMoveRight()){ 
      blockX += 1;
    }
  } else if (key == 's' || key == 'S') {
    if(canMoveDown()){
      blockY += 1;
    }
  } else if (key == 'r' || key == 'R') {
    currentBlock.rotate(board1);
  }else if (key == ' ') {
    while(canMoveDown()){
     blockY += 1; 
    }
    board1.addBlock(currentBlock, blockX, blockY);
    board1.clearCompletedRow();
    currentBlock = nextBlock;
    nextBlock = gen.generateBlock();
    blockX=3;
    blockY=0;
    
  }
}

boolean canMoveLeft(){
   int[][] shape = currentBlock.getShape();
   for(int i = 0; i < shape.length; i++){
     for(int j = 0; j < shape[i].length;j++){
       if(shape[i][j] != 0){
         if(blockX + j - 1 < 0 || board1.board[blockY + i][blockX + j - 1] != 0){
           return false;
       }
      }
     }
    }
  return true;
}

boolean canMoveRight(){
   int[][] shape = currentBlock.getShape();
   for(int i = 0; i < shape.length; i++){
     for(int j = 0; j < shape[i].length;j++){
       if(shape[i][j] != 0){
         if(blockX + j + 1 >= board1.columns || board1.board[blockY + i][blockX + j + 1] != 0 ){
           return false;
       }
      }
     }
    }
  return true;
}

boolean canMoveDown(){
   int[][] shape = currentBlock.getShape();
   for(int i = 0; i < shape.length; i++){
     for(int j = 0; j < shape[i].length;j++){
       if(shape[i][j] != 0){
         if(blockY + i + 1 >= board1.rows || board1.board[blockY + i + 1][blockX + j] != 0){
           return false;
       }
      }
     }
    }
  return true;
}

void dropBlock() {
  while(canMoveDown()){
    blockY += 1;
  }
}

void displayScore(){
  fill(255);
  textSize(32);
  text("Score: " + score, 10, 30);
}

void displayHighScore(){
  fill(255);
  textSize(32);
  text("High Score: " + highScore, 10, 60);
}

void displayNextBlock(){
  int nextBlockX = width - 150;
  int nextBlockY = 50;
  int cellSize = board1.cellSize;
  int[][] shape = nextBlock.getShape();
  int col = nextBlock.getColor();
  fill(col);
  for(int i = 0; i < shape.length; i++){
    for(int j = 0; j < shape[0].length; j++){
      if(shape[i][j] != 0){
        rect(nextBlockX + j * cellSize, nextBlockY + i * cellSize, cellSize, cellSize);
      }
    }
  }
  
}

void displayLossScreen() {
  background(0);
  fill(255);
  textSize(50);
  text("Game Over", 385, height / 2 - 50);
  fill(0,177,0);
    if(isMouseOver(350,425,300,50) == true){
      fill(82,100,74);
    };
  rect(350,425,300,50);
  fill(255);
  textSize(30);
  text("Return to main menu", 365, height / 2 + 60);
}

void displaySinglePlayerPage(){
  background(0,0,100);
  board1.display();
  drawBlock();
  displayScore();
  displayHighScore();
  displayNextBlock();
        
   if(millis() - lastDropTime > dropInterval){
     if(canMoveDown()){
         blockY +=1; 
      }else{
         board1.addBlock(currentBlock, blockX, blockY);
         board1.clearCompletedRow();
         currentBlock = gen.generateBlock();
         nextBlock = gen.generateBlock();
         blockX=3;
         blockY=0;
       }
       lastDropTime = millis();
     }
     
     gameOver = board1.isTopFull();
    
}
