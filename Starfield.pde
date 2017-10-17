Particle[] particles;
void setup()
{
  size(400,400);
  particles = new Particle[500];
  for(int i = 0; i<particles.length; i++)
  {
    particles[i] = new NormalParticle();
  }
  particles[1] = new JumboParticle();
  particles[0] = new OddballParticle();
}
void draw()
{
  background(0);
  for(int i = 0; i<particles.length; i++)
  {
    particles[i].show();
    particles[i].move();
  }
}
class NormalParticle implements Particle
{
  int Color;
  double myX, myY, speed, angle;
  NormalParticle()
  {
    myX = 200;
    myY = 200;
    angle = Math.PI*2*Math.random();
    speed = Math.random()*5;

  }
  void move()
  {
    myX += (Math.cos(angle)*speed);
    myY += (Math.sin(angle)*speed);
  }
  void show()
  {
    fill(255);
    ellipse((float)myX,(float)myY,5,5);
  }
}
interface Particle
{
  public void show();
  public void move();
}
class OddballParticle implements Particle
{
  double myX, myY, speed, angle;
  OddballParticle()
  {
    myX = 200;
    myY = 200;
    angle = Math.PI*3*Math.random();
    speed = (Math.random()*5);
  }
  public void show()
  {
    fill(0,255,0);
    rect((float)myX,(float)myY,10,10);
  }
  public void move()
  {    
    myX += (Math.cos(angle)+speed);
    myY += (Math.sin(angle)+speed);
  }
}
class JumboParticle extends NormalParticle
{
  public void show()
  {
  fill(255,0,0);
  ellipse((float)myX,(float)myY,50,50);
  }
}