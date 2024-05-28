boolean starterPage = true;
boolean selectionPage = false; 
int X;
int Y;

void setup(){
  size(1000,800);
  X = width/2;
  Y = height/2;
}

void draw(){
  
  //STARTER PAGE
  
  if(starterPage == true){
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
    //Selection Page

  if(selectionPage == true){
    background(0,0,100);
    
    //singleplayer button
    fill(0,177,0);
    if(isMouseOver(X-300,Y-200,600,75) == true){
      fill(82,100,74);
    }
    rect(X-300,Y-200,600,75);
    fill(255);
    textSize(65);
    text("Singleplayer", X-160, Y-140);
    
    
    //multiplayer button
    fill(0,177,0);
    if(isMouseOver(X-300,Y,600,75) == true){
      fill(82,100,74);
    }
    rect(X-300,Y,600,75);
    fill(255);
    textSize(65);
    text("Multiplayer", X-160, Y+60);
    
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
}
