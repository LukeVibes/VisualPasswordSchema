class Date {
  // ----- ATTRIBUTES -----
  private int s;
  private int min;
  private int h;
  private int d;
  private int mon;
  private int y;
  
  // ----- METHODS -----
  
  // constructor
  public Date() {
    this.s   = second();
    this.min = minute();
    this.h   = hour();
    this.d   = day();
    this.mon = month();
    this.y   = year();
  }
  
  // returns the date formatted as a string
  public String getAsString() {
    return str(this.d) + "-" + str(this.mon) + "-" + str(this.y) + " " + str(this.h) + ":" + str(this.min) + ":" + str(this.s);
  }
}