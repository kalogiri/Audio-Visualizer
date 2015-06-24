import toxi.geom.*;//importing the vector library
import controlP5.*;//Importing the slider library

ControlP5 BColorChanger;

int Circle;//The name Circle is what trigger for the slider code to recognise that it is affecting this variable
               //So i can use the circle variable in any of the functions and it would affect that function.

ArrayList B;

void setup() {
  size (600, 400);
  smooth();
  BColorChanger = new ControlP5(this);//(this) is used to tell the library that the library will affect this processing sketch
  Slider s = BColorChanger.addSlider("Circle",0,255,0,10,10,100,10);//the "Name" is what triggers the slider to be linked to that variable name. It also the name that will be displayed beside the Slider 
  B = new ArrayList();

  for (int i = 0; i < 150; i++)//there will be n number of ellipses depending on how many specified in i < n
  {
    Vec3D initialize = new Vec3D(random(width), random(300), 0);//This makes so that the ball starts at the top of the screen and at a random postion
    Ball ball = new Ball(initialize);//[Class] [class operator name] = new [Class](class function specified the line before)
    B.add(ball);//this then links the class Ball and the operator ball which is linked to the initialization of the program...
  }
}

void draw()
{
  background(0);

  for (int i = 0; i < B.size(); i ++)
  {
    Ball bs = (Ball) B.get(i);//get.(i) gets the location of i at the point in frame
    bs.runProg();//runProg is a function in the class Ball the resoon we can use bs instead of ball it is because bs is assigned for the class Ball in the for loop.
    //By using different operator names it becomes easier to change specific properties of the program.
  }
}

