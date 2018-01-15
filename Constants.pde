/* ----- Password Constants ----- */
final int[][] facebook = {{0,7,2}, {1,5,4}, {3,6,1}};
final int[][] email = {{1,5,7}, {1,3,2}, {3,4,1}};
final int[][] bank = {{2,7,1}, {4,5,3}, {7,2,1}};

final String logFilename = "../resources/OctoDotLogs.csv";
final String pstoreFilename = "../resources/pstore.txt";

final int facebookNum = 0;
final int emailNum = 1;
final int bankNum = 2;

int[] generateOrder() {
  IntList order = new IntList();
  int num1 = int(random(0,3));
  
  order.append(num1);
  
  int num2 = int(random(0,3));
  
  while (num2 == num1) {
    num2 = int(random(0,3));
  }
  order.append(num2);
  
  int num3 = int(random(0,3));
  
  while (num3 != num1 && num3 == num2) {
    num3 = int(random(0,3));
  }
  order.append(num3);
  
  return order.array();
}