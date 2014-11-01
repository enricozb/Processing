int N = 400;
Particle[] particles = new Particle[N];
PVector[] accels = new PVector[N];


void setup() {
	size(500, 500, OPENGL);
	__init__();
	noStroke();
}

void __init__() {
	for (int i = 0; i < N; i++)
		particles[i] = new Particle(random(width), random(height));
}

PVector getAccel(Particle one, Particle two) {
	// -1/d^2 * r
	PVector r = PVector.sub(two.pos, one.pos);
	float d = r.mag();
	r.normalize();
	return PVector.div(r, 1/12.0 * pow(d, 2));
}

void applyAcc() {
	for (int i =0; i < N; i++) {
		PVector accel = new PVector();

		for (int j = 0; j < N; j++) {
			if (i != j)
				accel.add(getAccel(particles[i], particles[j]));
		}

		accels[i] = accel;
	}
}

void draw() {
	fill(255);
	background(0);

	applyAcc();

	for (int i = 0; i < N; i++) {
		particles[i].draw();
		particles[i].applyAcc(accels[i]);


		float x = particles[i].pos.x;
		float y = particles[i].pos.y;
		
		if(x <= 0 || x >= width) {
			particles[i].vel.x *= -1;
		}
		if(y <= 0 || y >= height) {
			particles[i].vel.y *= -1;
		}
	}

}

class Particle {
	PVector pos, vel;

	Particle(float x, float y) {
		pos = new PVector(x, y);
		vel = new PVector();
	}

	void applyAcc(PVector acc) {
		vel.add(acc);
		vel.mult(1);
		pos.add(vel);
	}

	void draw() {
		ellipse(pos.x, pos.y, 4, 4);
	}
}