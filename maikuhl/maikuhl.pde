int a = 1;

void setup() {
	size(500, 500);
	rectMode(CENTER);
	colorMode(HSB);
	noStroke();
	noLoop();
}

void draw() {
	background(0);

	translate(width/2, height/2);
	scale(1, -1);
	rotate(radians(45));
	snowflake(0, 0, 150, 0, a);
}

void snowflake(float x, float y, float d, float depth, float max_depth) {
	if (depth <= max_depth) {
		// fill(map(depth,0,max_depth,0,255),200,200);
		rect(x, y, d, d);

		snowflake(x + d/2, y + d/2, d/2.5, depth + 1, max_depth);
		snowflake(x + d/2, y - d/2, d/2.5, depth + 1, max_depth);
		snowflake(x - d/2, y + d/2, d/2.5,depth + 1, max_depth);
		snowflake(x - d/2, y - d/2, d/2.5, depth + 1, max_depth);
	}
}

void keyPressed()
{
	if(keyCode == RIGHT)
			a++;
	if(keyCode == LEFT)
			a--;
	redraw();
}