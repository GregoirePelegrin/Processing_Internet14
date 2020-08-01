ArrayList<Cell> maze;
Creator creator;

int nbrCellWidth;
int nbrCellHeight;
float sizeCell;

void setup(){
  size(601, 601);
  frameRate(10);
  
  maze = new ArrayList<Cell>();
  
  nbrCellWidth = 20;
  nbrCellHeight = 20;
  sizeCell = min(width/nbrCellWidth, height/nbrCellHeight);
  
  for(int i=0; i<nbrCellWidth; i++){
    for(int j=0; j<nbrCellWidth; j++){
      Cell cell = new Cell(i, j);
      maze.add(cell);
    }
  }
  
  creator = new Creator();
}

void draw(){
  background(0);
  
  for(int i=0; i<maze.size(); i++){
    /*if(i == 2){
      for(Cell cell : maze.get(i).getNeighbours()){
        fill(255);
        rect(cell.row * sizeCell, cell.col * sizeCell, sizeCell, sizeCell);
      }
      rect(maze.get(i).row * sizeCell, maze.get(i).col * sizeCell, sizeCell, sizeCell);
    }*/
    maze.get(i).display();
  }
  creator.nextStep();
  creator.display();
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
