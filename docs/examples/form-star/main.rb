def setup
  createCanvas(720, 400)
end

def draw
  background(102)

  push()
  translate(width * 0.2, height * 0.5)
  rotate(frameCount / 200.0)
  star(0, 0, 5, 70, 3)
  pop()

  push()
  translate(width * 0.5, height * 0.5)
  rotate(frameCount / 50.0)
  star(0, 0, 80, 100, 40)
  pop()

  push()
  translate(width * 0.8, height * 0.5)
  rotate(frameCount / -100.0)
  star(0, 0, 30, 70, 5)
  pop()
end

def star(x, y, radius1, radius2, npoints)
  angle = TWO_PI / npoints
  halfAngle = angle / 2.0
  beginShape()
  0.step(TWO_PI, angle) do |a|
    sx = x + cos(a) * radius2
    sy = y + sin(a) * radius2
    vertex(sx, sy)
    sx = x + cos(a + halfAngle) * radius1
    sy = y + sin(a + halfAngle) * radius1
    vertex(sx, sy)
  end
  endShape(CLOSE)
end
