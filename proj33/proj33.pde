ArrayList<float[]> clicks = new ArrayList<float[]>();

int num = 50;

void setup() {
	size(500,500,OPENGL);
	smooth(8);
	ellipseMode(CORNER);
}

void draw() {
	for(int x = 0; x < num; x++)
		for(int y = 0; y < num; y++)
		{
			float xi = x * width/num;
			float yi = y * height/num;
			float val = 0;
			for(int i = 0; i < clicks.size(); i++)
			{
				float d = dist(xi,yi,clicks.get(i)[0],clicks.get(i)[1]);
				float t = clicks.get(i)[2] += .001;
				val += getVal(d,t);
				if(t > 950)
				{
					clicks.remove(i);
					i--;
				}
			}
			fill(val,255);
			rect(xi,yi,width/num,height/num);
		}
}

void mousePressed()
{
	clicks.add(new float[]{mouseX,mouseY,0});
}

float getVal(float d, float t)
{
	t = constrain(t,0,2*d);
	return 255 * pow((d-abs(d-t)),6)/pow(d,6);
}