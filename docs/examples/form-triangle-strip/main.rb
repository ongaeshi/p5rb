$x = nil
$y = nil
$outsideRadius = 150
$insideRadius = 100

def setup()
  createCanvas(720, 400)
  background(204)
  $x = width / 2
  $y = height / 2
end

def draw()
  background(204)

  numPoints = int(map(mouseX, 0, width, 6, 60))
  angle = 0
  angleStep = 180.0 / numPoints

  beginShape(TRIANGLE_STRIP)
  (0..numPoints).each do |i|
    px = $x + cos(radians(angle)) * $outsideRadius
    py = $y + sin(radians(angle)) * $outsideRadius
    angle += angleStep
    vertex(px, py)
    px = $x + cos(radians(angle)) * $insideRadius
    py = $y + sin(radians(angle)) * $insideRadius
    vertex(px, py)
    angle += angleStep
  end
  endShape()
end
