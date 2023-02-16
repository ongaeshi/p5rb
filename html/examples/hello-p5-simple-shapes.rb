def setup
  # Create the canvas
  createCanvas(720, 400)
  background(200)

  # Set colors
  fill(204, 101, 192, 127)
  stroke(127, 63, 120)

  # A rectangle
  rect(40, 120, 120, 40)
  # An ellipse
  ellipse(240, 240, 80, 80)
  # A triangle
  triangle(300, 100, 320, 100, 310, 80)

  # A design for a simple flower
  translate(580, 200)
  noStroke()
  10.times do
    ellipse(0, 30, 20, 80)
    rotate(Math::PI/5)
  end
end
