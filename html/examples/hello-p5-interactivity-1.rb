# for red, green, and blue color values
$r = $g = $b = nil

def setup
  createCanvas(720, 400)
  # Pick colors randomly
  $r = random(255)
  $g = random(255)
  $b = random(255)
end

def draw
  background(127)
  # Draw a circle
  strokeWeight(2)
  stroke($r, $g, $b)
  fill($r, $g, $b, 127)
  ellipse(360, 200, 200, 200)
end

# When the user clicks the mouse
def mousePressed
  # Check if mouse is inside the circle
  d = dist(mouseX, mouseY, 360, 200)
  if d < 100
    # Pick new random color values
    $r = random(255)
    $g = random(255)
    $b = random(255)
  end
end