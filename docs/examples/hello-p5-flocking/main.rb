$boids = []

def setup
  createCanvas(720, 400)

  # Add an initial set of boids into the system
  for _ in 0...100 do
    $boids.push(Boid.new(random(width), random(height)))
  end
end

def draw
  background(51)
  # Run all the boids
  $boids.each do |boid|
    boid.run($boids)
  end
end

class Boid
  attr_accessor :acceleration, :velocity, :position, :r, :maxspeed, :maxforce
  def initialize(x, y)
    @acceleration = createVector(0, 0)
    @velocity = P5::Vector.random2D()
    @position = createVector(x, y)
    @r = 3.0
    @maxspeed = 3     # Maximum speed
    @maxforce = 0.05  # Maximum steering force
  end

  def run(boids)
    flock(boids)
    update
    # borders
    render
  end

  # Forces go into acceleration
  def applyForce(force)
    @acceleration.add(force)
  end
  
  # We accumulate a new acceleration each time based on three rules
  def flock(boids)
    sep = separate(boids)  # Separation
    # ali = align(boids)     # Alignment
    # coh = cohesion(boids)  # Cohesion
    # Arbitrarily weight these forces
    sep.mult(2.5)
    # ali.mult(1.0)
    # coh.mult(1.0)
    # Add the force vectors to acceleration
    applyForce(sep)
    # applyForce(ali)
    # applyForce(coh)
  end

  # Method to update location
  def update
    # Update velocity
    @velocity.add(@acceleration)
    # Limit speed
    @velocity.limit(@maxspeed)
    @position.add(@velocity)
    # Reset acceleration to 0 each cycle
    @acceleration.mult(0)
  end

  # Separation
  # Method checks for nearby boids and steers away
  def separate(boids)
    desiredseparation = 25.0
    steer = createVector(0, 0)
    count = 0
    # For every boid in the system, check if it's too close
    boids.each do |boid|
      d = P5::Vector.dist(@position, boid.position)
      # If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if (d > 0) && (d < desiredseparation)
        # Calculate vector pointing away from neighbor
        diff = P5::Vector.sub(@position, boid.position)
        diff.normalize()
        diff.div(d) # Weight by distance
        steer.add(diff)
        count += 1 # Keep track of how many
      end
    end
    # Average -- divide by how many
    if count > 0
      steer.div(count)
    end
  
    # As long as the vector is greater than 0
    if steer.mag() > 0
      # Implement Reynolds: Steering = Desired - Velocity
      steer.normalize()
      steer.mult(@maxspeed)
      steer.sub(@velocity)
      steer.limit(@maxforce)
    end
    steer
  end

  # Draw boid as a circle
  def render
    fill(127, 127)
    stroke(200)
    ellipse(@position.x, @position.y, 16, 16)
  end
end