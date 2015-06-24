
class Ball
{
  Vec3D loc = new Vec3D (0, 0, 0); //Vec calls the vector component from the imported library and loc gives the location of the vector
  Vec3D speed = new Vec3D(random(-5, 5), random(-5, 5), 0);//This is the velocity component
  Vec3D gravity = new Vec3D(0, 0.2, 0); //The gravity vector

  Ball (Vec3D pos)//Specifies the X and the Y position to be drawn in the main Constructor
  {
    loc = pos;//This is the same as specifying the global variable to the local variable so that the whole program can access this
  }

  void runProg()//runs all the functions
  {
    display();
    animate();
    bounce();
    //gravity();
    lineBetween();//Creates lines between the balls
  }
  
  void lineBetween()//Creates the line which goes between the different ellipses
  {
    //B
    for (int i = 0; i< B.size(); i++)//This for loop is used to calculate the distance from one ball to another the size() is the size of the array list
    {
      Ball rest = (Ball)B.get(i);//This like gets the location of the different ellipses bouncing around and links it to a ball that is around it so that a line can be drawn inbetween them
      float distance = loc.distanceTo(rest.loc);
      if (distance > 0 && distance < 90)//creates lines of awesome
      {
        stroke(155,20,100);
        strokeWeight(0.6);
        line(loc.x, loc.y, rest.loc.x, rest.loc.y);//connects the lines between the ball using the rest. functionality for the balls, the loc.n is the location vector of the different ellipses and the y is the y co-ordinate of hte line so by connecting the 2 togethed it draws the line to the different circles
      }
    }
  }
  void gravity()//gravity for the ball
  {
    speed.addSelf(gravity);
  }

  void bounce()//bounces the ball
  {
    if (loc.x > width || loc.x < 0)
    {
      speed.x = speed.x * -1;
    }

    if (loc.y > height || loc.y < 0)
    {
      speed.y = speed.y * -1;
    }
  }

  void animate()//Moves the ball around
  {
    //loc.addSelf(speed) means the speed of the ball is linked to the location of the ball so the addSelf parameter connects the 2 together
    loc.addSelf(speed);//This does the action for both the speed for X,Y and Z if the 3d vector was used in this case 2D is used but 3D is specified just incase 3D was to be used
  } 

  void display()//Draws the ball
  {
    fill(Circle);
    ellipse(loc.x, loc.y, 5, 5);//loc.x and loc.y accesses the x and y postions
  }
}


