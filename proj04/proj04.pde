ArrayList<float[]> clicks = new ArrayList<float[]>();

float rSquareNum = 100;
float sqw = 500f/rSquareNum;
float speed = .001;
boolean lastPress = false;

void setup() {
	size(500,500,OPENGL);
	smooth(8);
	background(0);	
	noStroke();
}

void draw() {
	background(255);
	if(mousePressed && !lastPress)
	{
		lastPress = true;
		clicks.add(new float[]{mouseX, mouseY, 0});
	}
	else
	{
		lastPress = false;	
	}

	for(float i = 0; i < 500; i += sqw)
	{
		for(float j = 0; j < 500; j += sqw)
		{
			float rotateVal = 0;
			pushMatrix();
			for(int k = 0; k < clicks.size(); k++)
			{
				float[] arr = clicks.get(k);
				rotateVal += rval(i + sqw/2, j + sqw/2, arr[0], arr[1], arr[2] += speed);
				if(arr[2] > 1800)
				{
					clicks.remove(k);
					k--;
				}
			}
			translate(i + sqw/2, j + sqw/2, 0);
			rotateX(rotateVal);
			fill(0);
			rect(-sqw/2,-sqw/2,sqw,sqw);
			popMatrix();
		}
	}
}

float rval(float x, float y, float mx, float my, float time)
{
	float tmpD = dist(x, y, 0, mx, my, 0);
	float tval = 1 - abs(tmpD - time)/tmpD;
	return max(0, tval);
}