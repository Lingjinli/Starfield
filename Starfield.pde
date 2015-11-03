int pixelsNum = 300;
Particle[] partList = new Particle[pixelsNum];
void setup()
{
	size(400,400);
	background(0);
	for(int i = 0;i<pixelsNum;i++)
	{
		if(Math.random()<0.99)
		{
			partList[i] = new NormalParticle();
		}
		else
		{
			partList[i] = new JumboParticle();
		}
	}
	partList[pixelsNum-1] = new OddballParticle();
}
void draw()
{
	background(255);
	noFill();
	ellipse(200,200,150,150);
	for(int i=0;i<pixelsNum;i++)
	{
		partList[i].show();
		partList[i].move();
	}
}
class NormalParticle implements Particle
{
	double x,y,mySpeed,myAngle;
	int myColor;
	NormalParticle()
	{
		x = 200+(Math.random()*50-20);
		y = 200+(Math.random()*50-20);
		myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		mySpeed=(int)(Math.random()*2)*3;
		myAngle = Math.random()*5*Math.PI;
	}
	void move()
	{
		x = x + Math.cos(myAngle)*mySpeed;
		y = y + Math.sin(myAngle)*mySpeed;
		if(x<0 || x>400 || y<0 || y>400)
		{
			x = 200;
			y = 200;
		}
	}
	void show()
	{
		fill(myColor);
		ellipse((float)x,(float)y,15,15);
	}
}
interface Particle
{
	public void move();
	public void show();
}
class OddballParticle implements Particle
{
	double x,y,mySpeed,myAngle;
	int myColor;
	OddballParticle()
	{
		x = 200+(Math.random()*100-50);
		y = 200+(Math.random()*100-50);
		myColor = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
		mySpeed=2;
		myAngle = Math.random()*2*Math.PI;
	}
	void move()
	{
		x = x + Math.cos(myAngle)*mySpeed;
		y = y + Math.sin(myAngle)*mySpeed;
		if(x<0 || x>400 || y<0 || y>400)
		{
			x = 200;
			y = 200;
		}
	}
	void show()
	{
		fill(myColor);
		rect((float)x,(float)y,35,35);
	}
}
class JumboParticle extends NormalParticle
{
	JumboParticle()
		{
			mySpeed=(int)(Math.random()*4)+2;
		}
	void show()
		{
			fill(myColor);
			ellipse((float)x,(float)y,35,35);
		}
}
