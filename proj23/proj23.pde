int s = 1000;

Walker[] w = new Walker[s];

float a = 250;
float b = 250;

void setup() {
	size(500,500,P3D);
	background(255);
	stroke(0);
	fill(0);
	for(int i = 0; i < s; i++)
	{
		w[i] = new Walker(0,0,0);
	}
	smooth(8);
	fill(255);
	stroke(255);
}

float xr = 0; //X-rotation
float yr = 0; //Y-rotation
void draw() {
	background(0);
	translate(250,250,250);
	rotateY(-radians(xr));
	rotate (PI/2 - radians(yr), sin(PI/2+radians(xr)), 0, cos(PI/2+radians(xr)));
	for(Walker p : w)
	{
		p.update();
	}
}

void keyPressed()
{
	if(keyCode == UP)
		yr++;
	else if(keyCode == DOWN)
		yr--;
	else if(keyCode == RIGHT)
		xr++;
	else if(keyCode == LEFT)
		xr--;
}

class Walker
{
	int x;
	int y;
	int z;
	Walker(int x, int y, int z)
	{
		x = int(random(-200,200));
    	y = int(random(-200,200));
    	z = int(random(-200,200));
		this.x = x;
		this.y = y;
		this.z = z;
	}
	void update()
	{	
		pushMatrix();
		translate(x,y,z);
		ellipse(0,0,1,1);
		popMatrix();
	}
}