class Cell{
  int row;
  int col;
  
  boolean visited;
  
  boolean[] walls;
  
  Cell(int r, int c){
    this.row = r;
    this.col = c;
    
    this.visited = false;
    
    this.walls = new boolean[4];    
    this.walls[0] = true;
    this.walls[1] = true;
    this.walls[2] = true;
    this.walls[3] = true;
  }
  
  void display(){
    stroke(255);
    strokeWeight(1);
    if(this.walls[0]) line(this.row * sizeCell, this.col * sizeCell, this.row * sizeCell, (this.col+1) * sizeCell); 
    if(this.walls[1]) line(this.row * sizeCell, this.col * sizeCell, (this.row+1) * sizeCell, this.col * sizeCell);
    if(this.walls[2]) line((this.row+1) * sizeCell, this.col * sizeCell, (this.row+1) * sizeCell, (this.col+1) * sizeCell); 
    if(this.walls[3]) line(this.row * sizeCell, (this.col+1) * sizeCell, (this.row+1) * sizeCell, (this.col+1) * sizeCell);
    
    if(this.visited){
      noStroke();
      fill(150, 0, 150, 150);
      rect(this.row * sizeCell, this.col * sizeCell, sizeCell, sizeCell);
    }
  }
  
  ArrayList<Cell> getNeighbours(){
    ArrayList<Cell> neighbours = new ArrayList<Cell>();
    if(this.row != 0 && !maze.get((this.row-1)*nbrCellWidth + this.col).visited) neighbours.add(maze.get((this.row-1)*nbrCellWidth + this.col));
    if(this.col != 0 && !maze.get(this.row*nbrCellWidth + this.col-1).visited) neighbours.add(maze.get(this.row*nbrCellWidth + this.col-1));
    if(this.row != nbrCellHeight-1 && !maze.get((this.row+1)*nbrCellWidth + this.col).visited) neighbours.add(maze.get((this.row+1)*nbrCellWidth + this.col));
    if(this.col != nbrCellWidth-1 && !maze.get(this.row*nbrCellWidth + this.col+1).visited) neighbours.add(maze.get(this.row*nbrCellWidth + this.col+1));    
    return neighbours;
  }
}
