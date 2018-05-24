Button[] numButtons = new Button[10];
Button[] opButtons = new Button[1];

String ls, rs;
float ans;
char op;
boolean left, eq;


void setup() {
  size(440, 480);
  ls = "o";
  rs = "o";
  ans = 0.0;
  op = ' ';
  left = true;
  eq = false;
  numButtons[0] = new Button(90, 400, 70, 70).asNumber(0); 
  numButtons[1] = new Button(10, 400, 70, 70).asNumber(1);
  numButtons[2] = new Button(170, 400, 70, 70).asNumber(2);
  numButtons[3] = new Button(250, 400, 70, 70).asNumber(3);
  numButtons[4] = new Button(360, 400, 70, 70).asNumber(4);
  numButtons[5] = new Button(10, 320, 70, 70).asNumber(5);
  numButtons[6] = new Button(90, 320, 70, 70).asNumber(6);
  numButtons[7] = new Button(170, 320, 70, 70).asNumber(7);
  numButtons[8] = new Button(250, 320, 70, 70).asNumber(8);
  numButtons[9] = new Button(360, 320, 70, 70).asNumber(9);
  
    opButtons[0] = new Button(10, 100, 40, 20).asOperator('C');





  //opButtons[0] = new Button(175, 275).asOperator("+");
  //opButtons[1] = new Button(175, 275).asOperator("-");
}
void draw() {
  background(96, 108, 134);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].over();
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].over();
  }
  updateDisplay();
}


 /// void mouseReleased() {
    //for(int i=0; i<numButtons.length; i++) {
   // if (numButtons[i].hov && left) {
    //  ls += numButtons[i].v;
    //} else if (numButtons[i].hov && !left) {
    //rs += numButtons[i].v;
    //}
 // }



//void mousePressed() {
  //for (int i=0; i<numButtons.length; i++) {
   // Button inumButton = numButtons[i];
    //inumButton.clickButton();
    //if (inumButton.over) {
     // if (firstNum) {
      //  valueToCompare += int(inumButtonValue);
       // displayValue = valueToCompute;
      //} else {
       // valueToCompute2 += int(inumButton.numButtonValue);
        //displayValue = valueToCompute;
     // }
   // }
 // }
//}

void mouseReleased() {
  // 
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hov && left) {
      ls += numButtons[i].v;
    } else if (numButtons[i].hov && !left) {
      rs += numButtons[i].v;
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hov && opButtons[i].o == '+') { 
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '-') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '*') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '/') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == 'C') {
      performClear();
    } else if (opButtons[i].hov && opButtons[i].o == '=') {
      eq = true;
      performCalc();
    } else if (opButtons[i].hov && opButtons[i].o == 'n') {
      if (left) {
        ans = float(ls)*-1;
        ls = str((float)ans);
      } else {
        ans = float(rs)*-1;
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '%') {
      if (left) {
        ans = float(ls)*0.01;
        ls = str((float)ans);
      } else {
        ans = float(rs)*0.01;
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == 's') {
      if (left) {
        ans = sin(float(ls));
        ls = str((float)ans);
      } else {
        ans = sin(float(rs));
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == 'c') {
      if (left) {
        ans = cos(float(ls));
        ls = str((float)ans);
      } else {
        ans = cos(float(rs));
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '.') {
      if (left) {
        ls += opButtons[i].o;
      } else {
        rs += opButtons[i].o;
      }
    }
  }
}

void performClear() {
  ls = "0"; 
  rs = "0";
  ans = 0.0;
  op = ' ';
  left = true;
  eq = false;
}

void performCalc() {
  switch(op) {
  case '+': 
    ans = float(ls)+float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '-': 
    ans = float(ls)-float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '*': 
    ans = float(ls)*float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '/': 
    ans = float(ls)/float(rs);
    ls = str((float)ans);
    left = true;
    break;
  }
}

void updateDisplay() {

  fill(2, 11, 103);
  stroke(0);
  rect(10, 10, 415, 85, 4);
  fill(23,227,225);
  textSize(18);
   if (eq) {
    text((float)ans, 15, 80);
  } else {
    if (left) {
      text(ls, 15, 80);
    } else {
      text(rs, 15, 80);
    }
  }
  eq = false;
}