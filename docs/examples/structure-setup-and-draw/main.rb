$y = 100

# The statements in the setup() function
# execute once when the program begins
def setup
  # createCanvas must be the first statement
  createCanvas(720, 400)
  stroke(255) # Set line drawing color to white
  frameRate(30)
end
# The statements in draw() are executed until the
# program is stopped. Each statement is executed in
# sequence and after the last line is read, the first
# line is executed again.
def draw
  background(0) # Set the background to black
  $y = $y - 1
  $y = height if $y < 0
  line(0, $y, width, $y)
end