class Creator{
  Cell current;
  
  Creator(){
    this.current = maze.get(0);
    this.current.visited = true;
  }
  
  void nextStep(){
    ArrayList<Cell> neighbours = current.getNeighbours();
    
    if(neighbours.size() != 0){
      int next = floor(random(neighbours.size()));
      removeWall(this.current, neighbours.get(next));
      this.current = neighbours.get(next);
      this.current.visited = true;
    } else {
      noLoop();
    }
  }
  
  void display(){
    noStroke();
    fill(0, 255, 0, 200);
    rect(current.row * sizeCell, current.col * sizeCell, sizeCell, sizeCell);
  }
}
