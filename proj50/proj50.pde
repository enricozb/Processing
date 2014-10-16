float PHI = 1.618033988749894848204586834;

float k = 0;
float num = 100;
float rectw = 50;
void setup() 
{
	size(500,500,P2D);
	smooth(8);
	rectMode(CENTER);
	noStroke();
	colorMode(HSB);
}

void draw() 
{
	background(35);
	translate(width/2,height/2);
	rotate(-2.39996 * sin(k) * 5);
	for(int i = 0; i < num; i++)
	{
		pushMatrix();
		fill(i/num * 100, 170, 170);
		rotate(i*2.39996 * sin(k)/5);
		rect(0,0,rectw,(num - i) * 4 * sin(k),40 );
		popMatrix();
	}
	if(degrees(k) < 360)
		saveFrame();
	else {
		System.exit(0);
	}
	println(degrees(k));
	k += radians(1);
}