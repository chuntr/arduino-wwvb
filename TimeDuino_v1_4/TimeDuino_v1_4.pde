
// Go to setVariables to set time and such














boolean number[13][7]; // Numbers array, to be filled later
//set to boolean to save a few bytes, anyway, they will only be used for ON or OFF
#define YES 1;
#define NO 0;
boolean AM;
boolean PM;
char counter2;
char counter3;
char hour1;
char hour2;
char hour2counter;
char min1;
char min2;
char i = 0;
char seg[8]; // holds the segment ouput pins
long interval; // set to 60 (or 30) for testing
long previousMillis = 0; // for timing
//taken from http://www.arduino.cc/en/Tutorial/BlinkWithoutDelay
boolean doYouWantColon = 1;
boolean doYouWantBlinkyColon = 1; //set to 1 if you want the colon to blink
boolean doYouWant24HRTime = 1;
boolean doYouWantAMPM = 0;
char whatDigitDoYouWantTheDecimal = 1;
char ledPin =  3;      // the number of the colon pin
boolean ledState = LOW;             // ledState used to set the LED
long previousMillis1 = 0;        // will store last time LED was updated
long interval1 = 500; // interval at which to blink (milliseconds)
// set interval1 to 1000 if you want a longer blink (defaults to 500)

void setup(){
 int initPins = getPins();
 int variables = setVariables();
}

void loop(){
  
  int getTime = clock();
  int setSegments = segments();
  int colonFunction = blinkyColon();
  int numberArray = fillNumberArray();
  int findHour = hour1Switch();
  int findHour2 = hour2Switch();
  int findMin = min1Switch();
  int findMin2 = min2Switch();
  
}
