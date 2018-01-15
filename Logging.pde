/* ----- DEFINITION ----- */
class Logger {
  /* ----- ATTRIBUTES ----- */
  private StringList buffer;
  
  /* ----- METHODS ----- */
  
  //constructor
  public Logger() {
    buffer = new StringList();
  }
  
  /*----------
    name:     addLog
    purpose:  adds a log to a buffer of logs, logs eventually get flushed
              into log file
    input:    userid, passwordType, event
    output:   success
  */
  public boolean addLog(String userid, String passwordType, String event) {
    /*
      log format: "date/time","userid","passwordType","event"
      passwordType can be: - facebook
                           - email
                           - bank                 
      event can be: - start
                    - success
                    - fail
    */

    Date logTime = new Date();
    
    String newLog = logTime.getAsString() + "," + userid + "," + passwordType + "," + event;
    buffer.append(newLog);

    return true;
  }
  
  /*----------
    name:     flushLogs
    purpose:  writes all the logs in buffer to the log file
    input:    none
    output:   success
  */
  public boolean flushLogs() {
    String[]         lines = loadStrings(logFilename);
    StringList       tempLogs = new StringList(lines);
    
    tempLogs.append(buffer);
    buffer.clear();
    
    saveStrings(logFilename, tempLogs.array());
    return true;
  }
}