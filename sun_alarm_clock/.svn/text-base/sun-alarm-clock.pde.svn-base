/*
  analog pin 5 -> SCL of DS1307
  analog pin 4 -> SDA of DS1307
  digital pin 3 -> RX of 7 segment serial display
  
*/

#include <NewSoftSerial.h>
#include <Wire.h>
#include "RTClib.h"

#define SerInToArdu 2    // serial in from seven segment display (not used)
#define SerOutFrmArdu 3  //serial out to seven segment display

#define wDelay 1000//no ; here. Sets how long each "message" appears

NewSoftSerial mySerialPort(SerInToArdu,SerOutFrmArdu);
//  The above creates the serial channel we will use.

RTC_DS1307 RTC;

void setup()
{
  pinMode(SerOutFrmArdu,OUTPUT);
  pinMode(SerInToArdu,INPUT); //Not actually needed... put in
     //to be explicit as to data direction over serial lines
  
  mySerialPort.begin(9600);
  
  mySerialPort.print("v"); //To reset display module
  //See next demo program for more details, and text
  //in "Special Codes" section of....
  //http://www.arunet.co.uk/tkboyd/ec/ec1led4x7ser.htm

  // initialize DS1307
  Serial.begin(57600);
  Wire.begin();
  RTC.begin();
  
  RTC.adjust(DateTime(__DATE__, __TIME__));
  
  if (! RTC.isrunning()) 
  {
    Serial.println("RTC is NOT running!");
    // following line sets the RTC to the date & time this sketch was compiled
    RTC.adjust(DateTime(__DATE__, __TIME__));
  }

};

void loop()
{
  DateTime now = RTC.now();

  String DisplayTime;
   
  //Serial.print(now.year(), DEC);
  //Serial.print('/');
  //Serial.print(now.month(), DEC);
  //Serial.print('/');
  //Serial.print(now.day(), DEC);
  //Serial.print(' ');
  Serial.print(now.hour(), DEC);
  Serial.print(':');
  Serial.print(now.minute(), DEC);
  Serial.print(':');
  Serial.print(now.second(), DEC);
  Serial.println();
  
  String Hour = String(now.hour(), DEC);  
  String Min  = String(now.minute(), DEC);
  
  DisplayTime = zeroPad(Hour) + zeroPad(Min);
  
  Serial.println("LED: ");
  Serial.println(DisplayTime);
  Serial.println();
 
  mySerialPort.print(DisplayTime);
  blink_colon();
  //mySerialPort.print("xxxx");//Send an "x" to turn a digit off

};

void blink_colon()
{
  mySerialPort.print("w");
  mySerialPort.print(B00010000,BYTE);
  delay(wDelay);
  mySerialPort.print("w");
  mySerialPort.print(B00000000,BYTE);
  delay(wDelay);
};

String zeroPad(String number) 
{  
  if (number.length() < 2) 
  {
    number = "0" + number;
  } 
 return(number);
}
