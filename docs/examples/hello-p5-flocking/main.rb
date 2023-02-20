$boids = []

def setup
  createCanvas(720, 400)

  # Add an initial set of boids into the system
  for i in 0...100 do
    $boids.push(Boid.new(random(width), random(height)));
  end
end

def draw
  background(51);
  # Run all the boids
  $boids.each do |boid|
    boid.run($boids)
  end
end

class Boid
  def initialize(x, y)
    @acceleration = createVector(0, 0);
    @velocity = P5::Vector.random2D();
    @position = createVector(x, y);
    @r = 3.0;
    @maxspeed = 3;    # Maximum speed
    @maxforce = 0.05; # Maximum steering force
  end

  def run(boids)
    # flock(boids)
    # update
    # borders
    render
  end

  # Draw boid as a circle
  def render
    fill(127, 127)
    stroke(200)
    ellipse(@position.x, @position.y, 16, 16)
  end
end