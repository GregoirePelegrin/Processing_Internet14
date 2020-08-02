class Creator{
  Cell current;
  
  Creator(){
    this.current = maze.get(0);
    this.current.visited = true;
  }
  
  void nextStep(){
    ArrayList<Cell> neighbours = current.getNeighbours();
    
    if(neighbours.size() != 0){
      stack.add(this.current);
      int next = floor(random(neighbours.size()));
      removeWall(this.current, neighbours.get(next));
      this.current = neighbours.get(next);
      this.current.visited = true;
    } else if(stack.size() != 0){
      this.current = stack.remove(stack.size()-1);
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
