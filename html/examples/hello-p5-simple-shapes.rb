# require 'js'

# def setup
#   p "setup"
#   # Create the canvas
#   createCanvas(720, 400)
#   background(200)

#   # Set colors
#   fill(204, 101, 192, 127)
#   stroke(127, 63, 120)

#   # A rectangle
#   rect(40, 120, 120, 40)
#   # An ellipse
#   ellipse(240, 240, 80, 80)
#   # A triangle
#   triangle(300, 100, 320, 100, 310, 80)

#   # # A design for a simple flower
#   # translate(580, 200)
#   # noStroke()
#   # 10.times do
#   #   ellipse(0, 30, 20, 80)
#   #   rotate(PI/5)
#   # end
# end

# JS.global[:setup] = -> {
#   setup
# }

def setup
  createCanvas(700, 410)
end

def draw
  x = 100
  y = 100  
  background(0)
  fill(255)
  rect(x, y, 50, 50)
end
