/************************
 STATE CONTROL VARIABLES
 ********VVVVVVV********/
boolean failureTextShow = false;

int correctCounter = 0;
int errorCounter = 0;

int nextDot;

PFont font;  // Required for printing strings onto display
int state = 0;
final int main_menu = 1;
final int practiceFacebook = 2;
final int practiceEmail = 3;
final int practiceBank = 4;
final int passwordTestOne = 5;
final int passwordTestTwo = 6;
final int passwordTestThree = 7;


// start button properties
float startX;
float startY;
float buttonWidth;
float buttonHeight;
boolean startEnabled;
boolean startHover;
boolean startClicked;
// start button properties

// back button properties
float backX;
float backY;
boolean backEnabled;
boolean backHover;
boolean backClicked;
// back button properties

// next button properties
float nextX;
float nextY;
boolean nextEnabled;
boolean nextHover;
boolean nextClicked;
// next button properties

// Octodot title properties
float titleX;
float titleY;

// Password Test
String assignedPasswordTestOne;
String assignedPasswordTestTwo;
String assignedPasswordTestThree;

String currAssignedPasswordTest;

/********^^^^^^^********
 STATE CONTROL VARIABLES
 **********************/

/******************
 OCTODOT VARIABLES
 *****VVVVVV*******/

int count = 0;
int currentOct = 0; //Keeps track of the current Octogon
int clickCounter = 0;

boolean clear = false;

boolean click = true; //enables clicking and clickchecking to happen
int badOct = -1;      //integer representation of the octogon that was inputed wrong

//used for pulsing circles
boolean grow   = true;
boolean shrink = false;

//Color:
color red   = #D63059;
color green = #30D67E;

color pracLine = green;

//Octogon A
final int A_TOP1_X = 180;
final int A_TOP1_Y = 100;
final int A_TOP2_X = 320;
final int A_TOP2_Y = 100;

final int A_LEFT1_X = 120;
final int A_LEFT1_Y = 170;
final int A_LEFT2_X = 120;
final int A_LEFT2_Y = 300;

final int A_RIGHT1_X = 380;
final int A_RIGHT1_Y = 170;
final int A_RIGHT2_X = 380;
final int A_RIGHT2_Y = 300;

final int A_BOTTOM1_X = 180;
final int A_BOTTOM1_Y = 370;
final int A_BOTTOM2_X = 320;
final int A_BOTTOM2_Y = 370;


//Octogon B
final int B_TOP1_X = 590;
final int B_TOP1_Y = 100;
final int B_TOP2_X = 730;
final int B_TOP2_Y = 100;

final int B_LEFT1_X = 530;
final int B_LEFT1_Y = 170;
final int B_LEFT2_X = 530;
final int B_LEFT2_Y = 300;

final int B_RIGHT1_X = 790;
final int B_RIGHT1_Y = 170;
final int B_RIGHT2_X = 790;
final int B_RIGHT2_Y = 300;

final int B_BOTTOM1_X = 590;
final int B_BOTTOM1_Y = 380;
final int B_BOTTOM2_X = 730;
final int B_BOTTOM2_Y = 380;


//Octogon C
final int C_TOP1_X = 1000;
final int C_TOP1_Y = 100;
final int C_TOP2_X = 1140;
final int C_TOP2_Y = 100;

final int C_LEFT1_X = 940;
final int C_LEFT1_Y = 170;
final int C_LEFT2_X = 940;
final int C_LEFT2_Y = 300;

final int C_RIGHT1_X = 1200;
final int C_RIGHT1_Y = 170;
final int C_RIGHT2_X = 1200;
final int C_RIGHT2_Y = 300;

final int C_BOTTOM1_X = 1000;
final int C_BOTTOM1_Y = 380;
final int C_BOTTOM2_X = 1140;
final int C_BOTTOM2_Y = 380;


//Array of Dots (per Octogon)
OctoDot[] octA;
OctoDot[] octB;
OctoDot[] octC;

//Array of Octogons
OctoDot[][] allOct;

//List of clicked Dots
ArrayList<OctoDot> clickedDots;

final int CLICKBUFFER = 20;

boolean input = true;

int[][] rawPassword;

Logger logger;
String userID;


//Logging Varialbes
boolean firstrender = true;


//Password Random Stuff
int[] schemeOrder;

/*****^^^^^^^*****
 OCTODOT VARIABLES
 *****************/

///    0   1
/// 2         3
/// 4         5
//     6   7


// LINE ANIMATION

float xPos1;
float yPos1;
float yPos2;
float xPos2;
  
float goalX;
float goalY;
  
float speed;

// LINE ANIMATION


/*----------
 name:     Setup
 purpose:  Default Processing fucntion to set up data need before start of program
 input:    none
 output:   sets Octogon data and more
 */
void setup()
{
  size(1400, 800);

  startEnabled = true;
  backEnabled = false;
  nextEnabled = false;
  font = loadFont("MuseoSans-500-144.vlw"); // Load Custom Font
  state = main_menu;
  
  xPos1 = width/3;
  yPos1 = height/2.42;
  yPos2 = yPos1;
  xPos2 = xPos1;
    
  goalX = width - (width/2.9);
  goalY = height/2;
  
  speed = 86;

  smooth();

  allOct = new OctoDot[3][8];

  //Add all dots (with positions and values) to Octogon A
  octA = new OctoDot[8];
  octA[0] = new OctoDot(A_TOP1_X, A_TOP1_Y, 0);
  octA[1] = new OctoDot(A_TOP2_X, A_TOP2_Y, 1);
  octA[2] = new OctoDot(A_LEFT1_X, A_LEFT1_Y, 2);
  octA[3] = new OctoDot(A_RIGHT1_X, A_RIGHT1_Y, 3);
  octA[4] = new OctoDot(A_LEFT2_X, A_LEFT2_Y, 4);
  octA[5] = new OctoDot(A_RIGHT2_X, A_RIGHT2_Y, 5);
  octA[6] = new OctoDot(A_BOTTOM1_X, A_BOTTOM1_Y, 6);
  octA[7] = new OctoDot(A_BOTTOM2_X, A_BOTTOM2_Y, 7);
  allOct[0] = octA; //Add Octogon A to array of Octogons

  //Add all dots (with positions and values) to Octogon B
  octB = new OctoDot[8];
  octB[0] = new OctoDot(B_TOP1_X, B_TOP1_Y, 0);
  octB[1] = new OctoDot(B_TOP2_X, B_TOP2_Y, 1);
  octB[2] = new OctoDot(B_LEFT1_X, B_LEFT1_Y, 2);
  octB[3] = new OctoDot(B_RIGHT2_X, B_RIGHT1_Y, 3);
  octB[4] = new OctoDot(B_LEFT2_X, B_LEFT2_Y, 4);
  octB[5] = new OctoDot(B_RIGHT2_X, B_RIGHT2_Y, 5);
  octB[6] = new OctoDot(B_BOTTOM1_X, B_BOTTOM1_Y, 6);
  octB[7] = new OctoDot(B_BOTTOM2_X, B_BOTTOM2_Y, 7);
  allOct[1] = octB; //Add Octogon B to array of Octogons

  //Add all dots (with positions and values) to Octogon C
  octC = new OctoDot[8];
  octC[0] = new OctoDot(C_TOP1_X, C_TOP1_Y, 0);
  octC[1] = new OctoDot(C_TOP2_X, C_TOP2_Y, 1);
  octC[2] = new OctoDot(C_LEFT1_X, C_LEFT1_Y, 2);
  octC[3] = new OctoDot(C_RIGHT2_X, C_RIGHT1_Y, 3);
  octC[4] = new OctoDot(C_LEFT2_X, C_LEFT2_Y, 4);
  octC[5] = new OctoDot(C_RIGHT2_X, C_RIGHT2_Y, 5);
  octC[6] = new OctoDot(C_BOTTOM1_X, C_BOTTOM1_Y, 6);
  octC[7] = new OctoDot(C_BOTTOM2_X, C_BOTTOM2_Y, 7);
  allOct[2] = octC; //Add Octogon C to array of Octogons

  //Set up more data
  logger = new Logger();    
  userID = getNextUserID();
  clickedDots = new ArrayList<OctoDot>();
  rawPassword = new int[3][3];


  //assignedPasswordTest = "Bank"; //SHOULD BE SET BY "RANDOM FUNCTION"
  
  schemeOrder = generateOrder(); 
  
  String[] wordArray = {"Facebook","Email","Bank"};
  
  assignedPasswordTestOne =   wordArray[schemeOrder[0]];
  assignedPasswordTestTwo =   wordArray[schemeOrder[1]];
  assignedPasswordTestThree = wordArray[schemeOrder[2]];

}

/*----------
 name:     draw
 purpose:  Default Processing fucntion to draw to window. In out case it
 draws the circles and lines
 input:    none
 output:   draws to window
 */
void draw()
{
  background(#E3F0FF);

  switch(state)
  {
  case main_menu:
    // Delegate main menu rendering here
    drawTitle();
    drawStartButton();
    stroke(#F25858);
    strokeWeight(8);
    if(xPos2 <= goalX)
    {
      xPos2 += speed;
      speed -= (speed/9);
    }
    line(xPos1, yPos1, xPos2, yPos2);
    break;

  case practiceFacebook:
    drawLabel("Facebook", 0);
    drawBackButton();
    drawNextButton();
    renderUserLines();
    renderPracticeLines("Facebook");
    renderOctodots();
    drawNumbers(facebook);
    break;

  case practiceEmail:
    drawLabel("Email", 2);
    drawBackButton();
    drawNextButton();
    renderUserLines();
    renderPracticeLines("Email");
    renderOctodots();
    drawNumbers(email);
    break;

  case practiceBank:
    drawLabel("Bank", 0);
    drawBackButton();
    drawNextButton();
    renderUserLines();
    renderPracticeLines("Bank");
    renderOctodots();
    drawNumbers(bank);
    break;

  case passwordTestOne:
  drawLabel(assignedPasswordTestOne, 0);
  if(firstrender==true)
    {
       currAssignedPasswordTest = assignedPasswordTestOne;
       logger.addLog(userID, assignedPasswordTestOne, "start"); 
       firstrender=false;
    }
    drawBackButton();
    renderUserLines();
    renderOctodots();
    if(failureTextShow==true){failureText();}
    break;

    case passwordTestTwo:
    drawLabel(assignedPasswordTestTwo, 0);
    if(firstrender==true)
      {
         currAssignedPasswordTest = assignedPasswordTestTwo;
         logger.addLog(userID, assignedPasswordTestTwo, "start");
         firstrender=false;
      }
    drawBackButton();
    renderUserLines();
    renderOctodots();
    if(failureTextShow==true){failureText();}
    break;

    case passwordTestThree:
    drawLabel(assignedPasswordTestThree, 0);
    if(firstrender==true)
      {
         logger.addLog(userID, assignedPasswordTestThree, "start"); 
         firstrender=false;
      }
    drawBackButton();
    renderUserLines();
    renderOctodots();
    if(failureTextShow==true){failureText();}
    break;
  }
}

/*----------
 name:     mouseClickCheck
 purpose:  Check if the user clicked a dot, and apply the necessary steps to process the clicked dot
 input:    mouseX and mouse Y values
 output:   adds clicked dot to clickedDots[] list, increase currentOctogon if appropriate
 */
void mouseClickCheck(int mX, int mY)
{
  print("In Mouse Check" +clickCounter+ "\n");
  int dotX;
  int dotY;

  for (int i = 0; i < 8; i++)
  {
    dotX = allOct[currentOct][i].getX();
    dotY = allOct[currentOct][i].getY();
    if ( (mX < dotX+CLICKBUFFER && mX > dotX-CLICKBUFFER) && (mY < dotY+CLICKBUFFER && mY > dotY-CLICKBUFFER))
    {
      if (allOct[currentOct][i].getState()==false && clickCounter < 3)
      {
        clickedDots.add(allOct[currentOct][i]); //Add clicked dots to collection of clicked dots
        allOct[currentOct][i].changeState();    //Set clicked dot as "clicked", this avoids same dot from being clicked twice
        rawPassword[currentOct][clickCounter] = allOct[currentOct][i].getValue(); //set Value to Raw Password 
        clickCounter++;
        allOct[currentOct][i].setRadius(60);
      }

      if ((clickedDots.size() % 3)==0)
      {
        boolean pass = false;
        switch(state)
        {
        case practiceFacebook:
          pass = passwordChecker(currentOct, "Facebook");
          print(pass+"\n");
          break;

        case practiceBank:
          pass = passwordChecker(currentOct, "Bank");
          print("THIS: "+pass+"\n");
          break;

        case practiceEmail:
          pass = passwordChecker(currentOct, "Email");
          print(pass+"\n");
          break;

        case passwordTestOne:
          pass = passwordChecker(currentOct, assignedPasswordTestOne);
          print(pass+"\n");
          correctCounter++;
          if(correctCounter==3)
          {
            print("LOG SUCCESS SENT\n");
            logger.addLog(userID, assignedPasswordTestOne, "success");
            logger.flushLogs();
            correctCounter=0;
          }
          break;

          case passwordTestTwo:
          pass = passwordChecker(currentOct, assignedPasswordTestTwo);
          print(pass+"\n");
          correctCounter++;
          if(correctCounter==3)
          {
            print("LOG SUCCESS SENT\n");
            logger.addLog(userID, assignedPasswordTestTwo, "success");
            logger.flushLogs();
            correctCounter=0;
          }
          break;
          
          case passwordTestThree:
          pass = passwordChecker(currentOct, assignedPasswordTestThree);
          print(pass+"\n");
          correctCounter++;
          if(correctCounter==3)
          {
            print("LOG SUCCESS SENT\n");
            logger.addLog(userID, assignedPasswordTestThree, "success");
            logger.flushLogs();
            correctCounter=0;
          }
          break;
        }
        if (pass == false) 
        {
          pracLine=red;
          redraw();
          print("FAILURE\n");
          if(state>4)
          {
            failureTextShow = true;
            print("LOG FAIL SENT\n");
            logger.addLog(userID, currAssignedPasswordTest, "fail");
            logger.flushLogs();
            errorCounter++;
            correctCounter=0;
            if(errorCounter >= 3)
            {
                println("3 Strikes! You're Out!");
                clickedDots.clear();
                clickCounter   = 0;
                currentOct     = 0;
                correctCounter = 0;
                errorCounter   = 0;
                if(state<=7){state++;}
            }
            
          }
          clickCounter = 0;
          badOct = currentOct;
          click = false;
          setAllStates(false);
          setAllRadius(currentOct);
        } else
        {
          if (clickedDots.size()!=9)
          {
            currentOct++; //Once all three dots on Octogon are inputed, move on to next Octogon
            clickCounter = 0;
          }
        }
      }
    }
  }
}

/*----------
 name:     mouseClicked
 purpose:  Default Processing fucntion to launch everytime user presses+releases mouse button.
 In our case, it calls mouseClickCheck() with the current mouseX and mouseY values
 input:    User clicks
 output:   none
 */
void mouseClicked()
{

  if (click == true)
  {
    mouseClickCheck(mouseX, mouseY);
  } else
  {
    switch(state)
    {
    case practiceFacebook:
      print("memelord1\n");
      clearOneOct(badOct);
      pracLine = green;
      redraw();
      click = true;
      break;

    case practiceBank:
      print("memelord2\n");
      clearOneOct(badOct);
      pracLine = green;
      redraw();
      click = true;
      break;

    case practiceEmail:
      print("memelord3\n");
      clearOneOct(badOct);
      pracLine = green;
      redraw();
      click = true;
      break;

    case passwordTestOne:
      clearAllOct();
      pracLine = green;
      redraw();
      click = true;
      failureTextShow = false;
      break;
   
   case passwordTestTwo:
      clearAllOct();
      pracLine = green;
      redraw();
      click = true;
      failureTextShow = false;
      break;
    
    case passwordTestThree:
      clearAllOct();
      pracLine = green;
      redraw();
      click = true;
      failureTextShow = false;
      break;
    
    }
  }
}

void mousePressed()
{
  if (startHover && startEnabled)
  {
    //print("startHover: " + startHover + "\n");
    startClicked = true;
    //print("Forward, ho!\n");
    //print("startClicked: " + startClicked + "\n");
    startEnabled = false;
    backEnabled = true;
    nextEnabled = true;
  } else
  {
    startClicked = false;
    //print("startClicked: " + startClicked + "\n");
    //print("startHover: " + startHover + "\n");
  }

  if (backHover && backEnabled)
  {
    //print("backHover: " + backHover + "\n");
    backClicked = true;
    //print("Time Warp!\n");
    //print("backClicked: " + backClicked + "\n");
    if(state <= 1) backEnabled = false;    
    startEnabled = true;
  } else
  {
    backClicked = false;
    //print("backHover: " + backHover + "\n");
    //print("backClicked: " + backClicked + "\n");
  }
  
  if (nextHover && nextEnabled)
  {
    nextClicked = true;
    if(state <= 1) nextEnabled = false;    
    nextEnabled = true;
  } else
  {
    nextClicked = false;
  }
}

void mouseReleased()
{
  int count = 0;
  if (startClicked)
  {
    startHover = false;
    state = practiceFacebook;
    //state = practiceFacebook;
    //state = practiceBank;
    //state = practiceEmail;
    print("state: " + state + "\n");
    startClicked = false;
  }
  if (backClicked)
  {
    backHover = false;
    //state = main_menu;
    if(state > 1) state -= 1;
    print("state: " + state + "\n");
    backClicked= false;
  }
  if (nextClicked)
  {
    clickedDots.clear();
    clickCounter = 0;
    currentOct = 0;
    correctCounter = 0;
    nextHover = false;
    if(state < 7) state += 1;
    print("state: " + state + "\n");
    nextClicked = false;
    setAllStates(false);
    setAllRadius(0);
    setAllRadius(1);
    setAllRadius(2);
  }
}

void renderUserLines()
{
  stroke(111);
  strokeWeight(4);
  //Draw Lines
  drawLines();
}

void renderOctodots()
{
  fill(#FADCEA);
  stroke(111);
  strokeWeight(4);

  //Draw Octogon A
  ellipse(octA[0].getX(), octA[0].getY(), octA[0].getRadius(), octA[0].getRadius());
  ellipse(octA[1].getX(), octA[1].getY(), octA[1].getRadius(), octA[1].getRadius());
  ellipse(octA[2].getX(), octA[2].getY(), octA[2].getRadius(), octA[2].getRadius());
  ellipse(octA[3].getX(), octA[3].getY(), octA[3].getRadius(), octA[3].getRadius());
  ellipse(octA[4].getX(), octA[4].getY(), octA[4].getRadius(), octA[4].getRadius());
  ellipse(octA[5].getX(), octA[5].getY(), octA[5].getRadius(), octA[5].getRadius());
  ellipse(octA[6].getX(), octA[6].getY(), octA[6].getRadius(), octA[6].getRadius());
  ellipse(octA[7].getX(), octA[7].getY(), octA[7].getRadius(), octA[7].getRadius());

  //Draw Octogon B
  ellipse(octB[0].getX(), octB[0].getY(), octB[0].getRadius(), octB[0].getRadius());
  ellipse(octB[1].getX(), octB[1].getY(), octB[1].getRadius(), octB[1].getRadius());
  ellipse(octB[2].getX(), octB[2].getY(), octB[2].getRadius(), octB[2].getRadius());
  ellipse(octB[3].getX(), octB[3].getY(), octB[3].getRadius(), octB[3].getRadius());
  ellipse(octB[4].getX(), octB[4].getY(), octB[4].getRadius(), octB[4].getRadius());
  ellipse(octB[5].getX(), octB[5].getY(), octB[5].getRadius(), octB[5].getRadius());
  ellipse(octB[6].getX(), octB[6].getY(), octB[6].getRadius(), octB[6].getRadius());
  ellipse(octB[7].getX(), octB[7].getY(), octB[7].getRadius(), octB[7].getRadius());

  //Draw Octogon C
  ellipse(octC[0].getX(), octC[0].getY(), octC[0].getRadius(), octC[0].getRadius());
  ellipse(octC[1].getX(), octC[1].getY(), octC[1].getRadius(), octC[1].getRadius());
  ellipse(octC[2].getX(), octC[2].getY(), octC[2].getRadius(), octC[2].getRadius());
  ellipse(octC[3].getX(), octC[3].getY(), octC[3].getRadius(), octC[3].getRadius());
  ellipse(octC[4].getX(), octC[4].getY(), octC[4].getRadius(), octC[4].getRadius());
  ellipse(octC[5].getX(), octC[5].getY(), octC[5].getRadius(), octC[5].getRadius());
  ellipse(octC[6].getX(), octC[6].getY(), octC[6].getRadius(), octC[6].getRadius());
  ellipse(octC[7].getX(), octC[7].getY(), octC[7].getRadius(), octC[7].getRadius());
}

void renderPracticeLines(String practiceMode)
{
  stroke(pracLine, 75);
  strokeWeight(10);
  createPractice(practiceMode);
}

/*----------
 name:     drawLines
 purpose:  Draws lines that are created by the user in each Octogon
 input:    uses global variable clickedDots
 output:   draws lines on window
 */
void drawLines() {
  int size = clickedDots.size();

  //User Line Asthetics
  stroke(111);

  //Octogon A
  if (size>=2) {
    line(clickedDots.get(0).getX(), clickedDots.get(0).getY(), clickedDots.get(1).getX(), clickedDots.get(1).getY());
  }
  if (size>=3) {
    line(clickedDots.get(1).getX(), clickedDots.get(1).getY(), clickedDots.get(2).getX(), clickedDots.get(2).getY());
  }

  //Octogon B
  if (size>=5) {
    line(clickedDots.get(3).getX(), clickedDots.get(3).getY(), clickedDots.get(4).getX(), clickedDots.get(4).getY());
  }
  if (size>=6) {
    line(clickedDots.get(4).getX(), clickedDots.get(4).getY(), clickedDots.get(5).getX(), clickedDots.get(5).getY());
  }

  //Octogon C
  if (size>=8) {
    line(clickedDots.get(6).getX(), clickedDots.get(6).getY(), clickedDots.get(7).getX(), clickedDots.get(7).getY());
  }
  if (size>=9) {
    line(clickedDots.get(7).getX(), clickedDots.get(7).getY(), clickedDots.get(8).getX(), clickedDots.get(8).getY());
  }
}


void createPractice(String passwordType) {
  if (passwordType.equals("Bank")) {
    generateOctogonPracLines(bank);
  } else if (passwordType.equals("Facebook")) {
    generateOctogonPracLines(facebook);
  } else if (passwordType.equals("Email")) {
    generateOctogonPracLines(email);
  }
}

void generateOctogonPracLines(int[][] dotPoints) {

  //Octogon A
  int A_dotOneX   = allOct[0][dotPoints[0][0]].getX();
  int A_dotOneY   = allOct[0][dotPoints[0][0]].getY();
  int A_dotTwoX   = allOct[0][dotPoints[0][1]].getX();
  int A_dotTwoY   = allOct[0][dotPoints[0][1]].getY();
  int A_dotThreeX = allOct[0][dotPoints[0][2]].getX();
  int A_dotThreeY = allOct[0][dotPoints[0][2]].getY();
  line(A_dotOneX, A_dotOneY, A_dotTwoX, A_dotTwoY);
  line(A_dotTwoX, A_dotTwoY, A_dotThreeX, A_dotThreeY);

  //Octogon B
  int B_dotOneX   = allOct[1][dotPoints[1][0]].getX();
  int B_dotOneY   = allOct[1][dotPoints[1][0]].getY();
  int B_dotTwoX   = allOct[1][dotPoints[1][1]].getX();
  int B_dotTwoY   = allOct[1][dotPoints[1][1]].getY();
  int B_dotThreeX = allOct[1][dotPoints[1][2]].getX();
  int B_dotThreeY = allOct[1][dotPoints[1][2]].getY();
  line(B_dotOneX, B_dotOneY, B_dotTwoX, B_dotTwoY);
  line(B_dotTwoX, B_dotTwoY, B_dotThreeX, B_dotThreeY);

  //Octogon C
  int C_dotOneX   = allOct[2][dotPoints[2][0]].getX();
  int C_dotOneY   = allOct[2][dotPoints[2][0]].getY();
  int C_dotTwoX   = allOct[2][dotPoints[2][1]].getX();
  int C_dotTwoY   = allOct[2][dotPoints[2][1]].getY();
  int C_dotThreeX = allOct[2][dotPoints[2][2]].getX();
  int C_dotThreeY = allOct[2][dotPoints[2][2]].getY();
  line(C_dotOneX, C_dotOneY, C_dotTwoX, C_dotTwoY);
  line(C_dotTwoX, C_dotTwoY, C_dotThreeX, C_dotThreeY);
}


boolean passwordChecker(int currO, String passwordType) {
  boolean re = true;
  if (passwordType.equals("Bank")) {

    for (int i = 0; i < 3; i++) {
      if (rawPassword[currO][i]!=bank[currO][i]) {
        re = false;
      }
    }
  } else if (passwordType.equals("Facebook")) {

    for (int i = 0; i < 3; i++) {
      if (rawPassword[currO][i]!=facebook[currO][i]) {
        re = false;
      }
    }
  } else if (passwordType.equals("Email")) {

    for (int i = 0; i < 3; i++) {
      if (rawPassword[currO][i]!=email[currO][i]) {
        re = false;
      }
    }
  }
  return re;
}


void setAllStates(boolean instate) {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 8; j++) {
      allOct[i][j].setState(instate);
    }
  }
}

void setAllRadius(int oct) {
    for (int j = 0; j < 8; j++) {
      allOct[oct][j].setRadius(DOT_RADIUS);
    }
}

void clearAllOct(){
  clickedDots.clear();
  clickCounter = 0;
  currentOct = 0;  
}

void clearOneOct(int oct) {
  switch(oct) {
  case 0:
    clickedDots.remove(2);
    clickedDots.remove(1);
    clickedDots.remove(0);
    break;
  case 1:
    clickedDots.remove(5);
    clickedDots.remove(4);
    clickedDots.remove(3);
    break;
  case 2:
    clickedDots.remove(8);
    clickedDots.remove(7);
    clickedDots.remove(6);
    break;
  }
}

/*
void pulseCurrent()
 {
 
 
 
 }
 */


/**************
 GUI ATTRIBUTES
 ****VVVVVV*****/

void drawTitle()
{
  titleX = width/2;
  titleY = height/2.5;
  fill(0);
  textAlign(CENTER);
  textFont(font, 124);
  text("Octodot", titleX, titleY);
}

void drawStartButton()
{
  textFont(font, 56); // Specifying font created earlier
  startX = width/2;
  startY = height/2.05;
  buttonWidth = width/11;
  buttonHeight = height/12;
  rectMode(CENTER);
  fill(#B6B4F5);
  stroke(204, 102, 0);
  strokeWeight(2);

  // Check if cursor is hovering over button
  if (mouseX > startX-(buttonWidth/2) && mouseX < startX+(buttonWidth/2) &&
    mouseY > startY-(buttonHeight/2) && mouseY < startY+(buttonHeight/2))
  {
    startHover = true;
    if (startHover && !startClicked)
    {
      stroke(255);
      fill(#6FE3FF);
    } else if (!startHover && startClicked)
    {
      stroke(153);
      fill(#6FE7FF);
    }
  } else
  {
    startHover = false;
  }
  //rect(startX, startY, buttonWidth, buttonHeight);
  //fill(0);
  textAlign(CENTER, CENTER);
  text("Start", startX, startY);
}

void drawLabel(String name, int num)
{
  float labelX= width/2;
  float labelY = (height/2) + (height/2.5);
  fill(0);
  textAlign(CENTER);
  textFont(font, 56);
  if(num > 0)
  {
    String number = str(num);
    text(name, labelX, labelY + (buttonHeight/24));
  } else
  {
    text(name, labelX, labelY + (buttonHeight/24));
  }
}

void drawBackButton()
{
  backX = width/8;
  backY = (height/2) + (height/2.5);
  /*
  buttonWidth = width/5;
   buttonHeight = height/8;
   */
  rectMode(CENTER);  
  fill(135);
  stroke(111);
  strokeWeight(2);
  // Check if cursor is hovering over backbutton
  if (mouseX > backX-(buttonWidth/2) && mouseX < backX+(buttonWidth/2) &&
    mouseY > backY-(buttonHeight/2) && mouseY < backY+(buttonHeight/2))
  {
    backHover = true;
    if (backHover && !backClicked)
    {
      stroke(255);
      fill(#6FE3FF);
    } else if (!backHover && backClicked)
    {
      stroke(153);
      fill(#6FE7FF);
    }
  } else
  {
    backHover = false;
  }
  rect(backX, backY, buttonWidth, buttonHeight, 20);
  fill(0);
  text("Back", backX, backY + (buttonHeight/24));
}

void drawNextButton()
{
  nextX = width - (width/8);
  nextY = (height/2) + (height/2.5);
  rectMode(CENTER);  
  fill(135);
  stroke(111);
  strokeWeight(2);
  // Check if cursor is hovering over backbutton
  if (mouseX > nextX-(buttonWidth/2) && mouseX < nextX+(buttonWidth/2) &&
    mouseY > nextY-(buttonHeight/2) && mouseY < nextY+(buttonHeight/2))
  {
    nextHover = true;
    if (nextHover && !nextClicked)
    {
      stroke(255);
      fill(#6FE3FF);
    } else if (!nextHover && nextClicked)
    {
      stroke(153);
      fill(#6FE7FF);
    }
  } else
  {
    nextHover = false;
  }
  rect(nextX, nextY, buttonWidth, buttonHeight, 20);
  fill(0);
  text("Next", nextX, nextY + (buttonHeight/24));
} 

void pulseNext(int[][] values){
  nextDot = values[currentOct][clickCounter];
  println("NextDot: " + nextDot + "   currentOct: " + currentOct + "   clickCounter: " + clickCounter + "    X,Y" + allOct[currentOct][nextDot].getX()+","+allOct[currentOct][nextDot].getY());
  
  allOct[currentOct][nextDot].setRadius(40);
  /*
  if(grow==true)
  {
    allOct[currentOct][nextDot].setRadius( allOct[currentOct][nextDot].getRadius()+1 );
   
    if(allOct[currentOct][nextDot].getRadius()>=40)
    {
      grow=false;
      shrink=true;
    }
  }
  else if(shrink==true)
  {
    allOct[currentOct][nextDot].setRadius( allOct[currentOct][nextDot].getRadius()-1 );
    
    if(allOct[currentOct][nextDot].getRadius()<=20)
    {
      grow=true;
      shrink=false;
    }
  
  }
  
  */
}


void drawNumbers(int[][] values){
  
  textSize(20);
  fill(111); 
  int aX = allOct[currentOct][values[currentOct][0]].getX();
  int aY = allOct[currentOct][values[currentOct][0]].getY()+8;
  String a = "1";
  text(a, aX, aY);
  
  int bX = allOct[currentOct][values[currentOct][1]].getX();
  int bY = allOct[currentOct][values[currentOct][1]].getY()+8;
  String b = "2";
  text(b, bX, bY);
  
  int cX = allOct[currentOct][values[currentOct][2]].getX();
  int cY = allOct[currentOct][values[currentOct][2]].getY()+8;
  String c = "3";
  text(c, cX, cY);
}

void failureText(){
  float labelX= width/2;
  float labelY = (height/2) + (height/2.5) - 100;
  textSize(90);
  fill(red);
  text("w  r  o  n  g", labelX, labelY);
  textSize(30);
  text("click again to try again", labelX, labelY+50);
}