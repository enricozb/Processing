import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioPlayer song;

float[] rectangles = new float[1024];
void setup() {
	size(500,500,OPENGL);
	minim = new Minim(this);
	rectMode(CENTER);
	song = minim.loadFile("aphex.mp3");
	song.play();
}

void draw() {
	
	background(255);
	translate(width/2,height/2,0);
	//rotateY(PI/2);
	for(int i = 0; i < song.mix.size() - 1; i++)
	{
		fill(255);
		pushMatrix();

		rectangles[i] += 200*song.mix.get(i);
		rectangles[i] *= .1;
		translate(0,rectangles[i],i - 512);
		rect(0,0,10,10);

		popMatrix();
	}
}