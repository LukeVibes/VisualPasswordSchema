/* ----- CONSTANTS ----- */
final color  OFF_COLOR    = color(#6C6B6B);
final color  ON_COLOR     = color(#03FF2A);
final int    DOT_RADIUS   = 25;


/* ----- DEFINITION ----- */
class OctoDot {
  
  /* ----- ATTRIBUTES ----- */
  private int       x;
  private int       y;
  private int       r;
  private int       v;
  private boolean   state;
  private color     fill;
  
  /* ----- METHODS ----- */
  
  //constructor
  public OctoDot(int x, int y, int v) {
    this.x = x;
    this.y = y;
    this.v = v;
    this.r = DOT_RADIUS;
    this.state = false;
    this.fill = OFF_COLOR;
  }
 
  // getters
  public int getX() {
    return this.x; 
  }
 
  public int getY() {
    return this.y;
  }
  
  public int getValue() {
    return this.v;
  }
 
  public int getRadius() {
    return this.r;
  }
 
  public boolean getState() {
    return this.state;
  }
  
  public void setRadius(int inradius) {
    this.r = inradius;
  }
    
 
  // setters 
  public void setX(int x) {
    this.x = x;
  }
 
  public void setY(int y) {
    this.y = y;
  }
  
  public void setValue(int v) {
    this.v = v;
  }
 
  public void setState(boolean instate){
    this.state = instate;
  }
 
  // flips the current state and color
  public void changeState() {
    if (this.state) {
      this.state = false;
      this.fill  = OFF_COLOR;
    }
    else {
      this.state = true;
      this.fill  = ON_COLOR;
    }
  }
}