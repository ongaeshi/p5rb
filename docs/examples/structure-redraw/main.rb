$y = 0

# The statements in the setup() function
# execute once when the program begins
def setup
  createCanvas(720, 400)
  stroke(255)
  noLoop()
  $y = height * 0.5
end

# The statements in draw() are executed until the
# program is stopped. Each statement is executed in
# sequence and after the last line is read, the first
# line is executed again.
def draw
  background(0)
  $y = $y - 4
  $y = height if $y < 0
  line(0, $y, width, $y)
end

def mousePressed
  redraw()
end