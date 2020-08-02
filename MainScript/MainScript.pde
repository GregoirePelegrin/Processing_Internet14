ArrayList<Cell> maze;
Creator creator;
ArrayList<Cell> stack;

int nbrCellWidth;
int nbrCellHeight;
float sizeCell;

void setup(){
  size(801, 801);
  frameRate(60);
  
  maze = new ArrayList<Cell>();
  
  nbrCellWidth = 10;
  nbrCellHeight = 10;
  sizeCell = min(width/nbrCellWidth, height/nbrCellHeight);
  
  for(int i=0; i<nbrCellWidth; i++){
    for(int j=0; j<nbrCellWidth; j++){
      Cell cell = new Cell(i, j);
      maze.add(cell);
    }
  }
  
  creator = new Creator();
  
  stack = new ArrayList<Cell>();
}

void draw(){
  background(0);
  
  for(Cell cell : maze){
    cell.display();
  }
  creator.nextStep();
  creator.display();
  for(Cell cell : stack){
    fill(150, 0, 0, 150);
    rect(cell.row * sizeCell, cell.col * sizeCell, sizeCell, sizeCell);
  }
}

void removeWall(Cell c1, Cell c2){
  if(c1.row - c2.row == -1){
    c1.walls[2] = false;
    c2.walls[0] = false;
  } else if(c1.row - c2.row == 1){
    c1.walls[0] = false;
    c2.walls[2] = false;
  } else if(c1.col - c2.col == -1){
    c1.walls[3] = false;
    c2.walls[1] = false;
  } else if(c1.col - c2.col == 1){
    c1.walls[1] = false;
    c2.walls[3] = false;
  }
}
