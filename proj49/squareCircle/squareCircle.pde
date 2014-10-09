float x1 = 200;
float t = 0;
boolean on = false;


void setup() {
	size(500,500,OPENGL);
	noStroke();
}

int sign(float i)
{
	if(i < 0) 
		return -1;
	if(i > 0)
		return 1;
	return 0;
}

void draw() {
	background(0);
	translate(width/2, height/2);
	for(float i = 0; i < 360; i += 1)
	{
		//ellipse(x1 * cos(radians(i)), x1 * sin(radians(i)), 2,2);

		float from = x1 * sign(cos(radians(i)));
		float to = x1 * cos(radians(i));

		ellipse(lerp(from,to,t), x1 * sin(radians(i)), 2,2);

		from = x1 * sign(sin(radians(i)));
		to = x1 * sin(radians(i));

		ellipse(x1 * cos(radians(i)),lerp(from,to,t), 2,2);
	}
	if(t < 1 && on)
		t += .01;
}

void keyPressed()
{
	if(key == 's')
	{
		on = true;
	}
}