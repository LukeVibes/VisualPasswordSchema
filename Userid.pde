/* This file contains functions for accessing the persistent storage
   and determining what the next userid should be */

/*----------
  name:     getNextUserID
  purpose:  reads the pstore and determines the next userid, updates the
            pstore once processed
  input:    none
  output:   userid
*/
String getNextUserID() {
  String[]  lines         = loadStrings(pstoreFilename);
  String    useridLine    = lines[0];
  String[]  useridCount   = split(useridLine, ' ');
  int       currentCount  = int(useridCount[1]);
  
  currentCount++;
  
  String returnUser               = "user" + str(currentCount);
  String updatedPstoreUserIDLine  = useridCount[0] + " " + str(currentCount);
  
  lines[0] = updatedPstoreUserIDLine;
  
  saveStrings(pstoreFilename, lines);
  return returnUser;
}