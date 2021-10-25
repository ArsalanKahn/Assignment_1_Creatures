String[] Walk = { "WalkL1.gif", "WalkL2.gif", "WalkL3.gif", "WalkL4.gif", "WalkL5.gif", "WalkL6.gif", "WalkL7.gif", "WalkL8.gif", "WalkL9.gif" }; //image array
String[] Sleep = { "SlepL1.gif", "SlepL2.gif", "SlepL3.gif", "SlepL4.gif", "SlepL5.gif", "SlepL6.gif" };
String[] Idle = { "IdleL1.gif", "IdleL2.gif", "IdleL3.gif", "IdleL4.gif" };
String[] Eat = { "EatyL1.gif", "EatyL2.gif", "EatyL3.gif", "EatyL4.gif", "EatyL5.gif", "EatyL6.gif", "EatyL7.gif", "EatyL8.gif"};
String[] What;

PImage[] slidesWalk = new PImage[Walk.length]; //image array to images
PImage[] slidesSleep = new PImage[Sleep.length];
PImage[] slidesIdle = new PImage[Idle.length];
PImage[] slidesEat = new PImage[Eat.length]; 
PImage[] WhatNow;

PImage EatB; //images
PImage SleepB;
PImage WalkB;

int mode = 0; //int variables
int slideCounter = 0;
int Food = 0;
int Energy = 0;
int FitnessLvl = 0;

float x = 300; //button1  // float variables
float y = 100;
float w = 100;
float h = 100;

float x1 = 300; //button2
float y1 = 210;
float w1 = 100;      
float h1 = 100;

float x2 = 300; //button3
float y2 = 320;
float w2 = 100;
float h2 = 100;

void setup()
{
  
 size(500,500); //sie of screen
 stroke(0);
 noFill();
 
 
 
 EatB = loadImage("Eat.png"); //images of labels
 SleepB = loadImage("Sleep.png");
 WalkB = loadImage("Walk.png");
 
 for (int i=0; i<slidesWalk.length; i++) //declare images
  {
    slidesWalk[i] = loadImage(Walk[i]);
  }
  
 for (int i=0; i<slidesSleep.length; i++)
  {
    slidesSleep[i] = loadImage(Sleep[i]);
  }
  
  for (int i=0; i<slidesIdle.length; i++)
  {
    slidesIdle[i] = loadImage(Idle[i]);
  }
  
  for (int i=0; i<slidesEat.length; i++)
  {
    slidesEat[i] = loadImage(Eat[i]);
  }
 
  
}

void draw() 
{
  background(127); //background and buttons
  rect(x,y,w,h);
  rect(x1,y1,w1,h1);
  rect(x2,y2,w2,h2);
  //fill(255);
  imageMode(CORNER);
  image(EatB, 410, 100); //display images
  image(SleepB, 410, 210);
  image(WalkB, 410, 320);
  
   if (mode == 0) //change animation when click button
  {
    What = Idle;
    WhatNow = slidesIdle;
  }
  else if (mode == 1)
  {
    What = Eat;
    WhatNow = slidesEat;
  }
  else if (mode == 2)
  {
    What = Sleep;
    WhatNow = slidesSleep;
    
  }
  else if (mode == 3)
  {
    What = Walk;
    WhatNow = slidesWalk;
    
  }
  
  
  if(Food == 10 && Energy == 10 && FitnessLvl == 10) //leave
 {
    exit(); 
  }
  
  if(mousePressed) //change variables after button is clicked
  {
  if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) //eat
    {
     println("The mouse is pressed and over the button 1");
     Food = Food + 10;
     mode = 1;
    }
    else if(mouseX>x1 && mouseX <x1+w1 && mouseY>y && mouseY <y1+h1) //sleep
    {
     println("The mouse is pressed and over the button 2");
     Energy = Energy + 10;
     mode = 2;
    }
    else if(mouseX>x2 && mouseX <x2+w2 && mouseY>y2 && mouseY <y2+h2) //walk
    {
     println("The mouse is pressed and over the button 3");
     FitnessLvl = FitnessLvl + 10;
     mode = 3;
    }
    //mode = 0;
  }
 
 String EatS = "Food = " + Food; //change variable values
 text(EatS, 220, 100, 280, 320);
 String EnergyS = "Energy = " + Energy;
 text(EnergyS, 220, 210, 280, 320);
 String FitnessLvlS = "Fitness = " + FitnessLvl;
 text(FitnessLvlS, 220, 320, 280, 320);
  
  image(WhatNow[slideCounter], 0, 0); //flipbook of gif animation
  slideCounter = slideCounter + 1;
  delay(1000);
  if (slideCounter > WhatNow.length-1)
  {
    slideCounter= 0;
  }
  
 
}
