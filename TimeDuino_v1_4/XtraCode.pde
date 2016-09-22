
/* Clock code for TimeDuino, based partly off of code provided here. 
 
 http://www.arduino.cc/cgi-bin/yabb2/YaBB.pl?num=1265669651
 
 There is no copyright on this (but the code I based it off of might, I highly doubt that.
 Feel free to use my code all you want! -Astroboy907
 
 Note that I am using chars rather than ints, and even boolean sometimes, to save some bytes
 
PLEASE READ!!! The clock function (millis() ) will overflow (reset) in 50 days!
While it is unknown what this will do, please be prepared to take the risk
 */





int blinkyColon(){
// colon blinky code
  if(doYouWantBlinkyColon == 1) {
    unsigned long currentMillis1 = millis();

    if(currentMillis1 - previousMillis1 > interval1) {
      // save the last time you blinked the LED
      previousMillis1 = currentMillis1;  

      // if the LED is off turn it on and vice-versa:
      if (ledState == LOW)
        ledState = HIGH;
      else
        ledState = LOW;

      // set the LED with the ledState of the variable:
      digitalWrite(ledPin, ledState);
    }
  }
  else {
    if(doYouWantColon == 1){
      digitalWrite(3, HIGH);
    }
    else{
      digitalWrite(3,LOW);
      
  }
  }



  // end colon blinky code
}

int fillNumberArray(){
  #define ON HIGH;
  #define OFF LOW;
  
  number[0][1] = ON; // Fills the number array
  number[0][0] = ON; // Turns segment A on
  number[0][1] = ON; // Turns segment B on
  number[0][2] = ON; //etc...
  number[0][3] = ON;
  number[0][4] = ON;
  number[0][5] = ON;
  number[0][6] = OFF;

  number[1][0] = OFF;
  number[1][1] = ON;
  number[1][2] = ON;
  number[1][3] = OFF;
  number[1][4] = OFF;
  number[1][5] = OFF;
  number[1][6] = OFF;

  number[2][0] = ON;
  number[2][1] = ON;
  number[2][2] = OFF;
  number[2][3] = ON;
  number[2][4] = ON;
  number[2][5] = OFF;
  number[2][6] = ON;

  number[3][0] = ON;
  number[3][1] = ON;
  number[3][2] = ON;
  number[3][3] = ON;
  number[3][4] = OFF;
  number[3][5] = OFF;
  number[3][6] = ON;

  number[4][0] = OFF;
  number[4][1] = ON;
  number[4][2] = ON;
  number[4][3] = OFF;
  number[4][4] = OFF;
  number[4][5] = ON;
  number[4][6] = ON;

  number[5][0] = ON;
  number[5][1] = OFF;
  number[5][2] = ON;
  number[5][3] = ON;
  number[5][4] = OFF;
  number[5][5] = ON;
  number[5][6] = ON;

  number[6][0] = ON;
  number[6][1] = OFF;
  number[6][2] = ON;
  number[6][3] = ON;
  number[6][4] = ON;
  number[6][5] = ON;
  number[6][6] = ON;

  number[7][0] = ON;
  number[7][1] = ON;
  number[7][2] = ON;
  number[7][3] = OFF;
  number[7][4] = OFF;
  number[7][5] = OFF;
  number[7][6] = OFF;

  number[8][0] = ON;
  number[8][1] = ON;
  number[8][2] = ON;
  number[8][3] = ON;
  number[8][4] = ON;
  number[8][5] = ON;
  number[8][6] = ON;

  number[9][0] = ON;
  number[9][1] = ON;
  number[9][2] = ON;
  number[9][3] = ON;
  number[9][4] = OFF;
  number[9][5] = ON;
  number[9][6] = ON;

  // These next few numbers are used for 10, 11, and 12 o'clock only
  number[10][0] = ON; // pretty much a recount of digits 0, 1, and 2
  number[10][1] = ON;
  number[10][2] = ON;
  number[10][3] = ON;
  number[10][4] = ON;
  number[10][5] = ON;
  number[10][6] = OFF;

  number[11][0] = OFF;
  number[11][1] = ON;
  number[11][2] = ON;
  number[11][3] = OFF;
  number[11][4] = OFF;
  number[11][5] = OFF;
  number[11][6] = OFF;

  number[12][0] = ON;
  number[12][1] = ON;
  number[12][2] = OFF;
  number[12][3] = ON;
  number[12][4] = ON;
  number[12][5] = OFF;
  number[12][6] = ON;

}
int hour1Switch(){
  switch(hour1) {
  case 0:  
  if(doYouWant24HRTime == 1){
    while(i < 7) { // goes through the segments and writes them high or low
      digitalWrite(11, HIGH);
      if(number[0][i] == HIGH) { // if the number is high, write the cooresponding segment high
        digitalWrite(seg[i], HIGH);
        i++ ; // continues through the loop
      }
      else { 
        i++; // if it is not high, go through the loop again
      }
    }
  }
  else{
    digitalWrite(11, LOW);
  }
break;
case 1:  
   while(i < 7) { // goes through the segments and writes them high or low
      digitalWrite(11, HIGH);
      if(number[1][i] == HIGH) { // if the number is high, write the cooresponding segment high
        digitalWrite(seg[i], HIGH);
        i++ ; // continues through the loop
      }
      else { 
        i++; // if it is not high, go through the loop again
      }
    

  }
  
  break;
  case 2: // for 24 hour time
  while(i < 7) { // goes through the segments and writes them high or low
      digitalWrite(11, HIGH);
      if(number[2][i] == HIGH) { // if the number is high, write the cooresponding segment high
        digitalWrite(seg[i], HIGH);
        i++ ; // continues through the loop
      }
      else { 
        i++; // if it is not high, go through the loop again
      }   
  }
  
 }


if(AM == 1 && doYouWantAMPM == 1 && whatDigitDoYouWantTheDecimal == 1){
   PM = 0;
   digitalWrite(2, LOW);
   digitalWrite(A3, HIGH);
   digitalWrite(11, HIGH);
}
  
  delay(2.5); // dleays a little while, otherwise it would just be instentanious and you  would not see the digits
  digitalWrite(11, LOW); // Resets everything LOW
  digitalWrite(12, LOW);
  digitalWrite(8, LOW);
  digitalWrite(7, LOW);
  digitalWrite(5, LOW);
  digitalWrite(4, LOW);
  digitalWrite(2, LOW);
  digitalWrite(A0, LOW);
  digitalWrite(A1, LOW);
  digitalWrite(2, LOW);
   digitalWrite(A3, LOW);
 



  i = 0; // reset i
}
int hour2Switch(){

  if(hour2counter <=12){
  hour2 = hour2counter;
  
  }
  else{
    hour2 = hour2counter-12;
  }
switch(hour2){ // determines what number the hour is, then writes the corresponding number high, using the same technique as the above code
  case 0:
    while(i < 7) {
     digitalWrite(10, HIGH);
      if(number[0][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 1:

    while(i < 7) {
      digitalWrite(10, HIGH);
      if(number[1][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }

    break;
  case 2:
    while(i < 7) {
      digitalWrite(10, HIGH);
      if(number[2][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 3:
    while(i < 7) {
      digitalWrite(10, HIGH);
      if(number[3][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 4:
    while(i < 7) {
      digitalWrite(10, HIGH);
      if(number[4][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 5:
    while(i < 7) {
      digitalWrite(10, HIGH);
      if(number[5][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 6:
    while(i < 7) {
      digitalWrite(10, HIGH);
      if(number[6][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 7:
    while(i < 7) {
      digitalWrite(10, HIGH);
      if(number[7][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 8:
    while(i < 7) {
      digitalWrite(10, HIGH);
      if(number[8][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 9:
    while(i < 7) {
      digitalWrite(10, HIGH);
      if(number[9][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 10:
    while(i < 7) {
      digitalWrite(10, HIGH);
      if(number[0][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 11:
    while(i < 7) {
      digitalWrite(10, HIGH);
      if(number[1][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 12:
    while(i < 7) {
      digitalWrite(10, HIGH);
      if(number[2][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  }
  i = 0;
if(AM == 1 && doYouWantAMPM == 1 && whatDigitDoYouWantTheDecimal == 2){
   PM = 0;
   digitalWrite(2, LOW);
   digitalWrite(A3, HIGH);
}
  delay(2.5); // delays so it's visible
  // reset to LOW
  digitalWrite(10, LOW);
  digitalWrite(12, LOW);
  digitalWrite(8, LOW);
  digitalWrite(7, LOW);
  digitalWrite(5, LOW);
  digitalWrite(4, LOW);
  digitalWrite(2, LOW);
  digitalWrite(A0, LOW);
  digitalWrite(A1, LOW);
  digitalWrite(2, LOW);
   digitalWrite(A3, LOW);

}

int min1Switch(){
  switch(min1){ // determines the minute first digit number
  case 0:
    while(i < 7) {
      digitalWrite(9, HIGH);
      if(number[0][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 1:

    while(i < 7) {
      digitalWrite(9, HIGH);
      if(number[1][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }

    break;
  case 2:
    while(i < 7) {
      digitalWrite(9, HIGH);
      if(number[2][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 3:
    while(i < 7) {
      digitalWrite(9, HIGH);
      if(number[3][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 4:
    while(i < 7) {
      digitalWrite(9, HIGH);
      if(number[4][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 5:
    while(i < 7) {
      digitalWrite(9, HIGH);
      if(number[5][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;

  }
  i = 0;
  if(AM == 1 && doYouWantAMPM == 1 && whatDigitDoYouWantTheDecimal == 3){
   PM = 0;
   digitalWrite(2, LOW);
   digitalWrite(A3, HIGH);
}
  delay(2.5); // delays so it's visible
  // resets to LOW
  digitalWrite(9, LOW);
  digitalWrite(12, LOW);
  digitalWrite(8, LOW);
  digitalWrite(7, LOW);
  digitalWrite(5, LOW);
  digitalWrite(4, LOW);
  digitalWrite(2, LOW);
  digitalWrite(A0, LOW);
  digitalWrite(A1, LOW);
digitalWrite(2, LOW);
   digitalWrite(A3, LOW);

}

int min2Switch(){
   
  switch(min2){ // determines and switches second minute digit
  case 0:
    while(i < 7) {
      digitalWrite(6, HIGH);
      if(number[0][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 1:

    while(i < 7) {
      digitalWrite(6, HIGH);
      if(number[1][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }

    break;
  case 2:
    while(i < 7) {
      digitalWrite(6, HIGH);
      if(number[2][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 3:
    while(i < 7) {
      digitalWrite(6, HIGH);
      if(number[3][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 4:
    while(i < 7) {
      digitalWrite(6, HIGH);
      if(number[4][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 5:
    while(i < 7) {
      digitalWrite(6, HIGH);
      if(number[5][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 6:
    while(i < 7) {
      digitalWrite(6, HIGH);
      if(number[6][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 7:
    while(i < 7) {
      digitalWrite(6, HIGH);
      if(number[7][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 8:
    while(i < 7) {
      digitalWrite(6, HIGH);
      if(number[8][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;
  case 9:
    while(i < 7) {
      digitalWrite(6, HIGH);
      if(number[9][i] == HIGH) {
        digitalWrite(seg[i], HIGH);
        i++ ;
      }
      else { 
        i++; 
      }   
    }
    break;

  }
  i = 0;
if(AM == 1 && doYouWantAMPM == 1 && whatDigitDoYouWantTheDecimal == 4){
   PM = 0;
   digitalWrite(2, LOW);
   digitalWrite(A3, HIGH);
}
  delay(2.5);
  digitalWrite(6, LOW);
  digitalWrite(12, LOW);
  digitalWrite(8, LOW);
  digitalWrite(7, LOW);
  digitalWrite(5, LOW);
  digitalWrite(4, LOW);
  digitalWrite(2, LOW);
  digitalWrite(A0, LOW);
  digitalWrite(A1, LOW);
  digitalWrite(2, LOW);
   digitalWrite(A3, LOW);


}

int clock(){
  if(doYouWant24HRTime == 0) {
    unsigned long currentMillis = millis();

    if(currentMillis - previousMillis > interval) {

      previousMillis = currentMillis;  

  min2++;
  }

  if(min2 > 9) { // various hour and minute counters

    min1++;
    min2 = 0;
  }

  if(min1 > 5) {
    hour2counter++;
    min2 = 0;
    min1 = 0;
  }
  if(hour2 > 9) {
    hour1 = 1;
  }
  if(hour2counter == 13 && counter2 == 0) {
    
    hour1 = 0;
   hour2 - 12; 
    min1 = 0;
    min2 = 0;
    counter2 = 1;
  }
 else{
 }
 if(PM == 1 && doYouWantAMPM == 1){
   AM = 0;
   digitalWrite(2, HIGH);
   digitalWrite(A3, LOW);
 }
      
       if(hour2counter == 25){
        hour2counter = 1;
       hour2 = 1;
       hour1= 0;
       } 
       if(hour2counter < 12){
         PM = 0;
         AM = 1;
       }
  else{
       PM = 1;
    AM = 0;
       }
       if(hour2counter == 24){
         AM = 1;
         PM = 0;
       }
// end timing code
}
else{
  hour2 = hour2counter;
   unsigned long currentMillis = millis();

    if(currentMillis - previousMillis > interval) {

      previousMillis = currentMillis;  

  min2++;
    }

  if(min2 > 9) { // various hour and minute counters

    min1++;
    min2 = 0;
  }

  if(min1 > 5) {
    hour2counter++;
    min2 = 0;
    min1 = 0;
  }
  if(hour2counter > 9) {
    hour1++;
hour2counter = 0;
  }
  
  if(hour2counter > 3 && hour1 == 2) {
  
    hour1 = 0;
    hour2counter = 0; 
    min1 = 0;
    min2 = 0;
    
  }

}

}


int getPins(){
  pinMode(12, OUTPUT); // Seg A output
  pinMode(8, OUTPUT); // Seg B output
  pinMode(7, OUTPUT); // Seg C output
  pinMode(5, OUTPUT); // Seg D output
  pinMode(4, OUTPUT); // Seg E output
  pinMode(3, OUTPUT); // Colon output
  pinMode(A0, OUTPUT); // Seg F output
  pinMode(A1, OUTPUT); // Seg G output
  pinMode(11, OUTPUT); // Digit 1 output
  pinMode(10, OUTPUT); // Digit 2 output
  pinMode(9, OUTPUT);  // Digit 3 output
  pinMode(6, OUTPUT); // Digit 4 output
  pinMode(2, OUTPUT);
  pinMode(A3, OUTPUT);
}

int segments(){
  seg[0] = 12;
  seg[1] = 8;
  seg[2] = 7;

  seg[3] = 5;
  seg[4] = 4;
  seg[5] = A0;
  seg[6] = A1;
  seg[7] = 3; 
}
